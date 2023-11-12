resource "aws_security_group" "public_security_group" {
  name        = "public_sg"
  description = "PermitirSSH"
  vpc_id      = aws_vpc.vpc_virginia.id

  # ingress {
  #   description = "SSH from Internet"
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = [var.sg-allow-ip]
  # }

  dynamic "ingress" {
    for_each = var.ingress_port_list
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sg-allow-ip]
      description = "acceso-port-${ingress.value}"
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Allow SSH"
  }
}

