# --- Look up the infrastructure the platform already created ---

data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = [local.vpc_name]
  }
}

# All subnets in the VPC that hand out public IPs automatically
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }

  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
}

# aws_subnet must match exactly one subnet, so pick the first public one
data "aws_subnet" "public" {
  id = sort(data.aws_subnets.public.ids)[0]
}

data "aws_security_group" "ssh" {
  name   = local.sg_name
  vpc_id = data.aws_vpc.this.id
}

# Latest Amazon Linux 2023 AMI (login user: ec2-user)
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# --- The instance ---

resource "aws_instance" "this" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnet.public.id
  vpc_security_group_ids      = [data.aws_security_group.ssh.id]
  key_name                    = aws_key_pair.this.key_name
  associate_public_ip_address = true

  tags = merge(var.tags, {
    Name = local.instance_name
  })

  volume_tags = var.tags
}
