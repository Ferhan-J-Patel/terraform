resource "local_file" "tf-key" {
    content  = tls_private_key.rsa.private_key_pem
    filename = var.filename