variable "aws_region" {
  description = "AWS region where the resources are located."
  type        = string
}

variable "project_id" {
  description = "Project identifier used for tagging."
  type        = string
}

variable "vpc_name" {
  description = "Name tag of the existing VPC to discover."
  type        = string
}

variable "public_subnet_name" {
  description = "Name tag of the existing public subnet to discover."
  type        = string
}

variable "security_group_name" {
  description = "Name tag of the existing security group to discover."
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}
