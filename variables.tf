variable "aws_region" {
  description = "AWS region for region-specific resources."
  type        = string
}

variable "project_id" {
  description = "Project ID used for the Project tag on every resource."
  type        = string
}

variable "bucket_name" {
  description = "Name of the pre-created S3 bucket the IAM policy grants write access to."
  type        = string
}

variable "iam_group_name" {
  description = "Name of the IAM group."
  type        = string
}

variable "iam_policy_name" {
  description = "Name of the custom IAM policy for S3 write access."
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role that EC2 can assume."
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Name of the EC2 instance profile associated with the IAM role."
  type        = string
}
