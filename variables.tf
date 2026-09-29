variable "aws_region" {
  description = "AWS region where all resources are created."
  type        = string
}

# --- VPC ---

variable "vpc_name" {
  description = "Name of the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC."
  type        = string
}

# --- Subnet 1 ---

variable "subnet1_name" {
  description = "Name of the first public subnet."
  type        = string
}

variable "subnet1_cidr" {
  description = "CIDR block of the first public subnet."
  type        = string
}

variable "availability_zone1" {
  description = "Availability Zone of the first public subnet."
  type        = string
}

# --- Subnet 2 ---

variable "subnet2_name" {
  description = "Name of the second public subnet."
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR block of the second public subnet."
  type        = string
}

variable "availability_zone2" {
  description = "Availability Zone of the second public subnet."
  type        = string
}

# --- Subnet 3 ---

variable "subnet3_name" {
  description = "Name of the third public subnet."
  type        = string
}

variable "subnet3_cidr" {
  description = "CIDR block of the third public subnet."
  type        = string
}

variable "availability_zone3" {
  description = "Availability Zone of the third public subnet."
  type        = string
}

# --- Internet access ---

variable "internet_gateway" {
  description = "Name of the Internet Gateway."
  type        = string
}

variable "routing_table" {
  description = "Name of the public route table."
  type        = string
}
