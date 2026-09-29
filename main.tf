provider "aws" {
  region = var.aws_region
}

locals {
  ssh_sg_name          = "${var.project_id}-ssh-sg"
  public_http_sg_name  = "${var.project_id}-public-http-sg"
  private_http_sg_name = "${var.project_id}-private-http-sg"

  common_tags = {
    Project = var.project_id
  }
}
