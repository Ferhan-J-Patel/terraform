resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "example" {
  key_name   = var.key_pair_name
  public_key = tls_private_key.example.public_key_openssh
}

resource "local_file" "public_key" {
  content  = aws_key_pair.example.public_key
  filename = "/home/fjp/example-key.pub"
}