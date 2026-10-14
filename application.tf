# =========================================================
# Lookups: existing infrastructure and AMI
# =========================================================

data "aws_subnet" "public_a" {
  vpc_id     = var.vpc
  cidr_block = var.public_subnet_a_cidr
}

data "aws_subnet" "public_b" {
  vpc_id     = var.vpc
  cidr_block = var.public_subnet_b_cidr
}

# Latest Amazon Linux 2023 (standard, not "minimal") for x86_64
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

# =========================================================
# Launch Template: HOW each instance is built
# =========================================================

resource "aws_launch_template" "this" {
  name          = var.aws_launch_template_name
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  # Security groups go inside the network interface block when one is defined
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [var.ssh_inbound_id, var.http_inbound_id]
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  # Bash variables use $NAME (no braces) so Terraform doesn't try to interpolate them
  user_data = base64encode(<<-EOF
    #!/bin/bash
    dnf update -y
    dnf install -y httpd jq
    systemctl enable --now httpd

    # IMDSv2: get a session token first, then use it for every metadata request
    TOKEN=$(curl -s -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
    INSTANCE_ID=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/instance-id)
    PRIVATE_IP=$(curl -s -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4)

    echo "This message was generated on instance $INSTANCE_ID with the following IP: $PRIVATE_IP" > /var/www/html/index.html
  EOF
  )

  # Tags for the instances and volumes launched from this template
  tag_specifications {
    resource_type = "instance"
    tags          = local.common_tags
  }

  tag_specifications {
    resource_type = "volume"
    tags          = local.common_tags
  }

  # Tags for the launch template itself
  tags = local.common_tags
}

# =========================================================
# Load balancer: target group, ALB, listener
# =========================================================

resource "aws_lb_target_group" "this" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc

  health_check {
    path    = "/"
    matcher = "200"
  }

  tags = local.common_tags
}

resource "aws_lb" "this" {
  name               = var.load_balancer
  load_balancer_type = "application"
  internal           = false
  security_groups    = [var.lb_http_inbound_id]
  subnets            = [data.aws_subnet.public_a.id, data.aws_subnet.public_b.id]

  tags = local.common_tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  tags = local.common_tags
}

# =========================================================
# Auto Scaling Group: HOW MANY instances, and WHERE
# =========================================================

resource "aws_autoscaling_group" "this" {
  name                = var.aws_asg_name
  desired_capacity    = var.asg_desired_capacity
  min_size            = var.asg_min_size
  max_size            = var.asg_max_size
  vpc_zone_identifier = [data.aws_subnet.public_a.id, data.aws_subnet.public_b.id]

  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  # ASGs take tags as repeated "tag" blocks, not a map
  dynamic "tag" {
    for_each = local.common_tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }

  # The target group link is managed by aws_autoscaling_attachment below
  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
}

resource "aws_autoscaling_attachment" "this" {
  autoscaling_group_name = aws_autoscaling_group.this.name
  lb_target_group_arn    = aws_lb_target_group.this.arn
}
