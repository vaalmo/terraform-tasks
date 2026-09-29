variable "aws_region" {
  description = "AWS region where the infrastructure lives."
  type        = string
}

variable "project_id" {
  description = "Project ID used as the name prefix and Project tag value."
  type        = string
}

variable "allowed_ip_range" {
  description = "List of IP ranges (CIDR) allowed to access the infrastructure."
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the pre-created VPC."
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the pre-created public subnet."
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the pre-created private subnet."
  type        = string
}

variable "public_instance_id" {
  description = "ID of the pre-created public EC2 instance running Nginx on port 80."
  type        = string
}

variable "private_instance_id" {
  description = "ID of the pre-created private EC2 instance running Nginx on port 8080."
  type        = string
}
