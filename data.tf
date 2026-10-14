# Discover the existing infrastructure by its Name tag

data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "public" {
  vpc_id = data.aws_vpc.this.id

  filter {
    name   = "tag:Name"
    values = [var.public_subnet_name]
  }
}

data "aws_security_group" "this" {
  vpc_id = data.aws_vpc.this.id

  filter {
    name   = "tag:Name"
    values = [var.security_group_name]
  }
}

# Latest Amazon Linux 2023 (standard, not "minimal") for x86_64
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
