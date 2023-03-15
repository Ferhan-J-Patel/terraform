output "key_pair_name" {
  value = aws_key_pair.example.key_name
}

output "private_key_pem" {
  value = tls_private_key.example.private_key_pem
}