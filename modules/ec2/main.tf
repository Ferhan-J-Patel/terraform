module "key_pair" {
  source = "../key_pair"
}

resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  vpc_security_group_ids = var.sg_ids

  tags = var.tags

  connection {
    type        = "ssh"
    user        = var.ssh_user
    private_key = local_file.private_key.content
    host        = self.public_ip
  }
}
