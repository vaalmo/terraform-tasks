variable "vpc_name" {
  description = "Name of the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC."
  type        = string
}

variable "subnet1_name" {
  description = "Name of public subnet 1."
  type        = string
}

variable "subnet1_cidr" {
  description = "CIDR block of public subnet 1."
  type        = string
}

variable "availability_zone1" {
  description = "Availability Zone of public subnet 1."
  type        = string
}

variable "subnet2_name" {
  description = "Name of public subnet 2."
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR block of public subnet 2."
  type        = string
}

variable "availability_zone2" {
  description = "Availability Zone of public subnet 2."
  type        = string
}

variable "subnet3_name" {
  description = "Name of public subnet 3."
  type        = string
}

variable "subnet3_cidr" {
  description = "CIDR block of public subnet 3."
  type        = string
}

variable "availability_zone3" {
  description = "Availability Zone of public subnet 3."
  type        = string
}

variable "internet_gateway" {
  description = "Name of the Internet Gateway."
  type        = string
}

variable "routing_table" {
  description = "Name of the public route table."
  type        = string
}
