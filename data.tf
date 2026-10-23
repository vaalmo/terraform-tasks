# Each lookup works whether the task gives an ID (vpc-/subnet-/sg-) or a name.

data "aws_vpc" "this" {
  id = startswith(var.vpc, "vpc-") ? var.vpc : null

  dynamic "filter" {
    for_each = startswith(var.vpc, "vpc-") ? [] : [var.vpc]
    content {
      name   = "tag:Name"
      values = [filter.value]
    }
  }
}

data "aws_subnet" "public1" {
  vpc_id = data.aws_vpc.this.id
  id     = startswith(var.public_subnet1, "subnet-") ? var.public_subnet1 : null

  dynamic "filter" {
    for_each = startswith(var.public_subnet1, "subnet-") ? [] : [var.public_subnet1]
    content {
      name   = "tag:Name"
      values = [filter.value]
    }
  }
}

data "aws_subnet" "public2" {
  vpc_id = data.aws_vpc.this.id
  id     = startswith(var.public_subnet2, "subnet-") ? var.public_subnet2 : null

  dynamic "filter" {
    for_each = startswith(var.public_subnet2, "subnet-") ? [] : [var.public_subnet2]
    content {
      name   = "tag:Name"
      values = [filter.value]
    }
  }
}

data "aws_security_group" "ssh" {
  vpc_id = data.aws_vpc.this.id
  id     = startswith(var.ssh_inbound, "sg-") ? var.ssh_inbound : null

  dynamic "filter" {
    for_each = startswith(var.ssh_inbound, "sg-") ? [] : [var.ssh_inbound]
    content {
      name   = "group-name"
      values = [filter.value]
    }
  }
}

data "aws_security_group" "http" {
  vpc_id = data.aws_vpc.this.id
  id     = startswith(var.http_inbound, "sg-") ? var.http_inbound : null

  dynamic "filter" {
    for_each = startswith(var.http_inbound, "sg-") ? [] : [var.http_inbound]
    content {
      name   = "group-name"
      values = [filter.value]
    }
  }
}

data "aws_security_group" "lb_http" {
  vpc_id = data.aws_vpc.this.id
  id     = startswith(var.lb_http_inbound, "sg-") ? var.lb_http_inbound : null

  dynamic "filter" {
    for_each = startswith(var.lb_http_inbound, "sg-") ? [] : [var.lb_http_inbound]
    content {
      name   = "group-name"
      values = [filter.value]
    }
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
}
