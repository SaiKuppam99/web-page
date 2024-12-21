resource "aws_security_group" "allow_all" {
  name        = "${var.vpc_name}-allow-all"
  description = "Allow specific inbound traffic"
  vpc_id      = aws_vpc.vpc_name.id

  # Dynamically generate ingress rules using for_each
  dynamic "ingress" {
    for_each = var.ingress_service
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"         # Assuming TCP protocol for all ports
      cidr_blocks = ["0.0.0.0/0"] # Open to all
    }
  }

  # Egress rule allowing all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}