resource "aws_iam_group" "this" {
  name = var.iam_group_name
  # aws_iam_group does not support tags
}

resource "aws_iam_policy" "s3_write" {
  name        = var.iam_policy_name
  description = "Write-only access to the ${var.bucket_name} S3 bucket."

  policy = templatefile("${path.module}/policy.json", {
    bucket_name = var.bucket_name
  })

  tags = local.common_tags
}

resource "aws_iam_role" "ec2" {
  name = var.iam_role_name

  # Trust policy: who is allowed to assume this role
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  # Permissions policy: what the role can do once assumed
  managed_policy_arns = [aws_iam_policy.s3_write.arn]

  tags = local.common_tags
}

resource "aws_iam_instance_profile" "ec2" {
  name = var.iam_instance_profile_name
  role = aws_iam_role.ec2.name

  tags = local.common_tags
}
