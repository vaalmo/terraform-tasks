variable "aws_region" {
  description = "AWS region where the S3 bucket is created."
  type        = string
}

variable "bucket_name" {
  description = "Globally unique name of the S3 bucket."
  type        = string
}

variable "tags" {
  description = "Tags applied to every resource created by this configuration."
  type        = map(string)
}
