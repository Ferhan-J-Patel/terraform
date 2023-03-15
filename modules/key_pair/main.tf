resource "aws_key_pair" "example" {
  key_name   = var.key_pair_name
  public_key = file("home/fjp/example-key.pub")
}