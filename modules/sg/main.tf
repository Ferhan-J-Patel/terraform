resource "aws_security_group" "main" {
  name_prefix = var.name_prefix
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.cidr_blocks
  }

  tags = var.tags
}