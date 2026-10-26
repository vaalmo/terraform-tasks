resource "aws_security_group" "ssh" {
  name        = var.ssh_security_group_name
  description = "SSH from allowed IP ranges"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_range
  }

  # Terraform-created SGs have no outbound rule by default;
  # instances need outbound to install httpd.
  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.ssh_security_group_name
  }
}

resource "aws_security_group" "public_http" {
  name        = var.public_http_security_group_name
  description = "HTTP from allowed IP ranges (load balancer)"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_ip_range
  }

  # The ALB needs outbound to reach the instances
  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.public_http_security_group_name
  }
}

resource "aws_security_group" "private_http" {
  name        = var.private_http_security_group_name
  description = "HTTP from the public HTTP security group only (instances)"
  vpc_id      = var.vpc_id

  ingress {
    description     = "HTTP from the public HTTP security group"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.public_http.id]
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.private_http_security_group_name
  }
}
