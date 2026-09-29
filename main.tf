provider "aws" {
  region = var.aws_region
}

locals {
  common_tags = {
    Project = var.project_id
  }
}
