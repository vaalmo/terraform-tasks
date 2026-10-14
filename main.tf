provider "aws" {
  region = var.aws_region
}

locals {
  common_tags = {
    Terraform = "true"
    Project   = var.project_id
  }
}
