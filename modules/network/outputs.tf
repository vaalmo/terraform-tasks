output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "IDs of the three public subnets."
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id,
    aws_subnet.public_3.id,
  ]
}
