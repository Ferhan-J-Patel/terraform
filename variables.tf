variable "vpc_name" {
  type    = string
  default = "my-vpc"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_public_subnet_cidr_blocks" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_private_subnet_cidr_blocks" {
  type    = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "sg_name_prefix" {
  type    = string
  default = "my-sg"
}

variable "sg_ingress_from_port" {
  type    = number
  default = 80
}

variable "sg_ingress_to_port" {
  type    = number
  default = 80
}

variable "sg_ingress_protocol" {
  type    = string
  default = "tcp"
}

variable "sg_cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags" {
type = map(string)
default = {}
}

variable "ec2_name" {
type = string
default = "my-ec2"
}

variable "ec2_ami_id" {
type = string
}

variable "ec2_instance_type" {
type = string
default = "t2.micro"
}

variable "ec2_tags" {
type = map(string)
default = {}
}
