variable "region" {
  description = "AWS region where all resources are created"
  type        = string
}

variable "prefix" {
  description = "Naming prefix shared by all resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "internet_cidr" {
  description = "Destination CIDR for internet-bound traffic routed through the Internet Gateway"
  type        = string
}

variable "public_subnets" {
  description = "Public subnets keyed by name suffix, each with its availability zone and CIDR block"
  type = map(object({
    availability_zone = string
    cidr_block        = string
  }))
}
