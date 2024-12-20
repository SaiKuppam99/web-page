variable "vpc_name" {
  description = "Name of the VPC"
}
variable "internet_gateway_name" {
  description = "Name of the internet gatway"
}
variable "vpc_cidr_block_value" {
  description = "values of the CIDR block of the VPC"
}
variable "public_subnets" {
  description = "Name of the public subnet"
}
variable "azs" {
  description = "Name of the availability zones"
}
variable "public_subnet_cidr_block_value" {
  description = "values of the CIDR block of the public subnets"
}
variable "private_subnets" {
  description = "Name of the private subnet"
}
variable "private_subnet_cidr_block_value" {
  description = "values of the CIDR block of the private subnets"
}
variable "public_route_table" {
  description = "Name of the public route table"
}
variable "private_route_table" {
  description = "Name of the private route table"
}
variable "environment" {
  description = "Name of the environment"
}
