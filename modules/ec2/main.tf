module "key_pair" {
  source = "../key-pair"
}

resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type

  key_name      = module.key_pair.key_pair_name

  subnet_id     = var.subnet_id

  vpc_security_group_ids = var.sg_ids

  tags = var.tags
}
