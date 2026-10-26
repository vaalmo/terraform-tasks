variable "vpc_id" {
  description = "ID of the VPC where the security groups are created."
  type        = string
}

variable "allowed_ip_range" {
  description = "List of CIDR ranges allowed to reach SSH and public HTTP."
  type        = list(string)
}

variable "ssh_security_group_name" {
  description = "Name of the SSH security group."
  type        = string
}

variable "public_http_security_group_name" {
  description = "Name of the public HTTP security group."
  type        = string
}

variable "private_http_security_group_name" {
  description = "Name of the private HTTP security group."
  type        = string
}
