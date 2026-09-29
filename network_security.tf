# --- Existing instances: look up their primary network interfaces ---

data "aws_instance" "public" {
  instance_id = var.public_instance_id
}

data "aws_instance" "private" {
  instance_id = var.private_instance_id
}

# --- Security groups ---

resource "aws_security_group" "ssh" {
  name        = local.ssh_sg_name
  description = "SSH and ICMP from allowed IP ranges"
  vpc_id      = var.vpc_id

  tags = merge(local.common_tags, { Name = local.ssh_sg_name })
}

resource "aws_security_group" "public_http" {
  name        = local.public_http_sg_name
  description = "HTTP and ICMP from allowed IP ranges"
  vpc_id      = var.vpc_id

  tags = merge(local.common_tags, { Name = local.public_http_sg_name })
}

resource "aws_security_group" "private_http" {
  name        = local.private_http_sg_name
  description = "HTTP 8080 and ICMP from the public HTTP security group only"
  vpc_id      = var.vpc_id

  tags = merge(local.common_tags, { Name = local.private_http_sg_name })
}

# --- SSH SG rules ---

resource "aws_security_group_rule" "ssh_tcp" {
  type              = "ingress"
  description       = "SSH"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.allowed_ip_range
  security_group_id = aws_security_group.ssh.id
}

resource "aws_security_group_rule" "ssh_icmp" {
  type              = "ingress"
  description       = "ICMP (all types)"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = var.allowed_ip_range
  security_group_id = aws_security_group.ssh.id
}

# --- Public HTTP SG rules ---

resource "aws_security_group_rule" "public_http_tcp" {
  type              = "ingress"
  description       = "HTTP"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.allowed_ip_range
  security_group_id = aws_security_group.public_http.id
}

resource "aws_security_group_rule" "public_http_icmp" {
  type              = "ingress"
  description       = "ICMP (all types)"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = var.allowed_ip_range
  security_group_id = aws_security_group.public_http.id
}

# --- Private HTTP SG rules (source = public HTTP SG, no CIDRs) ---

resource "aws_security_group_rule" "private_http_tcp" {
  type                     = "ingress"
  description              = "HTTP 8080 from public HTTP SG"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.public_http.id
  security_group_id        = aws_security_group.private_http.id
}

resource "aws_security_group_rule" "private_http_icmp" {
  type                     = "ingress"
  description              = "ICMP (all types) from public HTTP SG"
  from_port                = -1
  to_port                  = -1
  protocol                 = "icmp"
  source_security_group_id = aws_security_group.public_http.id
  security_group_id        = aws_security_group.private_http.id
}

# --- Attach SGs to the instances' network interfaces ---
# (adds to the SGs already on the ENI; the platform SG stays in place)

resource "aws_network_interface_sg_attachment" "public_ssh" {
  security_group_id    = aws_security_group.ssh.id
  network_interface_id = data.aws_instance.public.network_interface_id
}

resource "aws_network_interface_sg_attachment" "public_http" {
  security_group_id    = aws_security_group.public_http.id
  network_interface_id = data.aws_instance.public.network_interface_id
}

resource "aws_network_interface_sg_attachment" "private_ssh" {
  security_group_id    = aws_security_group.ssh.id
  network_interface_id = data.aws_instance.private.network_interface_id
}

resource "aws_network_interface_sg_attachment" "private_http" {
  security_group_id    = aws_security_group.private_http.id
  network_interface_id = data.aws_instance.private.network_interface_id
}
