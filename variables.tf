variable "aws_region" {
  description = "AWS region where all resources are created."
  type        = string
}

# --- Network ---

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

# --- Network security ---

variable "allowed_ip_range" {
  description = "List of CIDR ranges allowed to reach the infrastructure over SSH and HTTP."
  type        = list(string)
}

variable "ssh_security_group_name" {
  description = "Name of the SSH security group."
  type        = string
}

variable "public_http_security_group_name" {
  description = "Name of the public HTTP security group (used by the load balancer)."
  type        = string
}

variable "private_http_security_group_name" {
  description = "Name of the private HTTP security group (used by the instances)."
  type        = string
}

# --- Application ---

variable "aws_launch_template_name" {
  description = "Name of the launch template."
  type        = string
}

variable "aws_asg_name" {
  description = "Name of the Auto Scaling group."
  type        = string
}

variable "load_balancer" {
  description = "Name of the Application Load Balancer."
  type        = string
}

variable "target_group_name" {
  description = "Name of the ALB target group (max 32 characters)."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in the Auto Scaling group."
  type        = number
}

variable "asg_min_size" {
  description = "Minimum number of instances in the Auto Scaling group."
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in the Auto Scaling group."
  type        = number
}
