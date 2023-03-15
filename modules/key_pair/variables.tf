variable "key_pair_name" {
  description = "The name of the key pair to create"
  type        = string
  default     = "example-key"
}

variable "file_loc" {
  description = "Location where pem file will be download"
  type        = string
  default     = "/home/fjp/example-key.pem"
}