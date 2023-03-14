vpc_name = "my-vpc"
vpc_cidr_block = "10.0.0.0/16"
vpc_public_subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_private_subnet_cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]

sg_name_prefix = "my-sg"
sg_ingress_from_port = 80
sg_ingress_to_port = 80
sg_ingress_protocol = "tcp"
sg_cidr_blocks = ["0.0.0.0/0"]

ec2_ami_id = "ami-0c94855ba95c71c99"
ec2_instance_type = "t2.micro"