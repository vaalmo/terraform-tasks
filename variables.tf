variable "aws_region" {
  description = "AWS region where all resources are created."
  type        = string
}

variable "project_id" {
  description = "Project ID used for the Project tag."
  type        = string
}

# --- Pre-created environment ---

variable "vpc" {
  description = "Name (Name tag) of the pre-created VPC."
  type        = string
}

variable "public_subnet_a_cidr" {
  description = "CIDR block of the pre-created public subnet A."
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "CIDR block of the pre-created public subnet B."
  type        = string
}

variable "ssh_inbound_id" {
  description = "Name of the security group that allows SSH to the EC2 instances."
  type        = string
}

variable "http_inbound_id" {
  description = "Name of the security group that allows HTTP to the EC2 instances."
  type        = string
}

variable "lb_http_inbound_id" {
  description = "Name of the security group that allows HTTP from the internet to the load balancer."
  type        = string
}

variable "iam_instance_profile" {
  description = "Name of the pre-created IAM instance profile for the EC2 instances."
  type        = string
}

variable "key_name" {
  description = "Name of the pre-created key pair for SSH access."
  type        = string
}

# --- Resources created in this task ---

variable "aws_launch_template_name" {
  description = "Name of the Launch Template."
  type        = string
}

variable "aws_asg_name" {
  description = "Name of the Auto Scaling Group."
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
  description = "EC2 instance type used by the Launch Template."
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group."
  type        = number
}

variable "asg_min_size" {
  description = "Minimum number of instances in the Auto Scaling Group."
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in the Auto Scaling Group."
  type        = number
}
