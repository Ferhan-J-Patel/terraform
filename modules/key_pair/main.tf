resource "aws_key_pair" "example" {
  key_name   = var.key_pair_name
  public_key = "${home_dir}/example-key.pem"
}