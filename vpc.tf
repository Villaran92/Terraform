resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  #cidr_block = lookup(var.virginia_cidr, terraform.workspace)
  tags = {
    Name = "${var.nombre}-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc_virginia.id
  cidr_block              = var.subnets[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "Publica-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc_virginia.id
  cidr_block = var.subnets[1]
  tags = {
    Name = "Privada-${local.sufix}"
  }
  depends_on = [aws_subnet.public_subnet]
}

