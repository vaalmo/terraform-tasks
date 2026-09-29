output "vpc_id" {
  description = "ID of the VPC."
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "CIDR block of the VPC."
  value       = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "IDs of all public subnets."
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id,
    aws_subnet.public_3.id,
  ]
}

output "public_subnet_cidr_block" {
  description = "CIDR blocks of all public subnets."
  value = [
    aws_subnet.public_1.cidr_block,
    aws_subnet.public_2.cidr_block,
    aws_subnet.public_3.cidr_block,
  ]
}

output "public_subnet_availability_zone" {
  description = "Availability Zones of all public subnets."
  value = [
    aws_subnet.public_1.availability_zone,
    aws_subnet.public_2.availability_zone,
    aws_subnet.public_3.availability_zone,
  ]
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway."
  value       = aws_internet_gateway.this.id
}

output "routing_table_id" {
  description = "ID of the public route table."
  value       = aws_route_table.public.id
}
