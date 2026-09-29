provider "aws" {
  region = var.aws_region
}

locals {
  # Names of the pre-created resources we look up
  vpc_name = "${var.project_id}-vpc"
  sg_name  = "${var.project_id}-sg"

  # Names of the resources we create
  keypair_name  = "${var.project_id}-keypair"
  instance_name = "${var.project_id}-ec2"
}
