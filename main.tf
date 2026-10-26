provider "aws" {
  region = var.aws_region
}

# 1. Network: VPC, subnets, IGW, route table
module "network" {
  source = "./modules/network"

  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr

  subnet1_name       = var.subnet1_name
  subnet1_cidr       = var.subnet1_cidr
  availability_zone1 = var.availability_zone1

  subnet2_name       = var.subnet2_name
  subnet2_cidr       = var.subnet2_cidr
  availability_zone2 = var.availability_zone2

  subnet3_name       = var.subnet3_name
  subnet3_cidr       = var.subnet3_cidr
  availability_zone3 = var.availability_zone3

  internet_gateway = var.internet_gateway
  routing_table    = var.routing_table
}

# 2. Security groups: needs the VPC ID from the network module
module "network_security" {
  source = "./modules/network_security"

  vpc_id           = module.network.vpc_id
  allowed_ip_range = var.allowed_ip_range

  ssh_security_group_name          = var.ssh_security_group_name
  public_http_security_group_name  = var.public_http_security_group_name
  private_http_security_group_name = var.private_http_security_group_name
}

# 3. Application: needs subnets from network and SGs from network_security
module "application" {
  source = "./modules/application"

  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids

  instance_security_group_ids = [
    module.network_security.ssh_security_group_id,
    module.network_security.private_http_security_group_id,
  ]
  lb_security_group_id = module.network_security.public_http_security_group_id

  aws_launch_template_name = var.aws_launch_template_name
  aws_asg_name             = var.aws_asg_name
  load_balancer            = var.load_balancer
  target_group_name        = var.target_group_name

  instance_type        = var.instance_type
  asg_desired_capacity = var.asg_desired_capacity
  asg_min_size         = var.asg_min_size
  asg_max_size         = var.asg_max_size
}
