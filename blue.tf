# ================= BLUE =================

resource "aws_launch_template" "blue" {
  name          = var.blue_launch_template_name
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  # Public IP so the startup script can download httpd
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [data.aws_security_group.ssh.id, data.aws_security_group.http.id]
  }

  user_data = base64encode(<<-SCRIPT
    #!/bin/bash
    dnf install -y httpd
    systemctl enable --now httpd
    echo "<h1>Blue Environment</h1>" > /var/www/html/index.html
  SCRIPT
  )

  tag_specifications {
    resource_type = "instance"
    tags          = merge(local.common_tags, { Name = "${var.blue_asg_name}-instance", Environment = "blue" })
  }

  tags = merge(local.common_tags, { Environment = "blue" })
}

resource "aws_lb_target_group" "blue" {
  name     = var.blue_target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.this.id

  health_check {
    path    = "/"
    matcher = "200"
  }

  tags = merge(local.common_tags, { Environment = "blue" })
}

resource "aws_autoscaling_group" "blue" {
  name                = var.blue_asg_name
  desired_capacity    = var.asg_desired_capacity
  min_size            = var.asg_min_size
  max_size            = var.asg_max_size
  vpc_zone_identifier = [data.aws_subnet.public1.id, data.aws_subnet.public2.id]
  target_group_arns   = [aws_lb_target_group.blue.arn]

  launch_template {
    id      = aws_launch_template.blue.id
    version = "$Latest"
  }

  dynamic "tag" {
    for_each = merge(local.common_tags, { Environment = "blue" })
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}
