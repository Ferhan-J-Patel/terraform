resource "local_file" "private_key" {
  content  = tls_private_key.example.private_key_pem
  filename = "${home_dir}/example-key.pem"
}