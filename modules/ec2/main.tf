resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id     = var.subnet_id

  vpc_security_group_ids = var.sg_ids

  tags = var.tags

  user_data = <<EOF
  #!/bin/bash
  sudo ./xfce.sh
  sudo apt install -y dbus-x11
  sudo systemctl enable xrdp --now
  sudo echo kali:kali | sudo chpasswd
  sudo reboot
  EOF
}
