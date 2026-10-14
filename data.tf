# Reads the outputs of the Landing Zone's Terraform state (read-only).
# This is NOT a backend for our project: our own state stays local.
data "terraform_remote_state" "base_infra" {
  backend = "s3"

  config = {
    bucket = var.state_bucket
    key    = var.state_key
    region = var.aws_region
  }
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
