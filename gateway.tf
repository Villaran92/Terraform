resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_virginia.id
  tags   = var.nombre_gw
}
