resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidr)
  vpc_id            = aws_vpc.vpc_name.id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-public_subnet-${count.index + 1}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.vpc_name.id
  cidr_block        = element(var.private_subnet_cidr, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name        = "${var.vpc_name}-private_subnet-${count.index + 1}"
    Owner       = local.Owner
    costcenter  = local.costcenter
    TeamDL      = local.TeamDL
    environment = var.environment
  }
}