variable "name_prefix" {
  type    = string
  default = "my-sg"
}

variable "vpc_id" {
  type = string
}

variable "ingress_from_port" {
  type    = number
  default = 80
}

variable "ingress_to_port" {
  type    = number
  default = 80
}

variable "ingress_protocol" {
  type    = string
  default = "tcp"
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "tags" {
  type    = map(string)
  default = {}
}