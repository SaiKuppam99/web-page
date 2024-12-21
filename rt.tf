resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_name.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_name.id
  }
  tags = {
    Name        = "${var.vpc_name}-public-rt"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc_name.id

  tags = {
    Name        = "${var.vpc_name}-private-rt"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment

  }
}
resource "aws_route_table_association" "public_route_table_rta" {
  count          = length(var.public_subnet_cidr)
  subnet_id      = element(aws_subnet.public_subnets.*.id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table_association" "private_route_table_rta" {
  count          = length(var.private_subnet_cidr)
  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}