provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  name                    = var.vpc_name
  cidr_block              = var.vpc_cidr_block
  public_subnet_cidr_blocks  = var.vpc_public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.vpc_private_subnet_cidr_blocks
}

module "sg" {
  source = "./modules/sg"

  name_prefix         = var.sg_name_prefix
  vpc_id              = module.vpc.vpc_id
  ingress_from_port   = var.sg_ingress_from_port
  ingress_to_port     = var.sg_ingress_to_port
  ingress_protocol    = var.sg_ingress_protocol
  cidr_blocks         = var.sg_cidr_blocks
  tags                = var.sg_tags

  depends_on = [
    module.vpc
  ]
}

module "key_pair" {
  source = "./modules/key_pair"

  key_pair_name  = var.ec2_key_pair_name
  file_loc       = var.pem_loc 
}

module "ec2" {
  source = "./modules/ec2"

  name           = var.ec2_name
  ami_id         = var.ec2_ami_id
  instance_type  = var.ec2_instance_type
  subnet_id      = module.vpc.public_subnet_ids[0]
  sg_ids         = [module.sg.sg_id]
  tags           = var.ec2_tags
  key_name  = module.key_pair.key_pair_name
  depends_on = [
    module.vpc,
    module.sg,
    module.key_pair
  ]
}

module "iam" {
  source = "./modules/iam"
}

module "iam_policy" {
  source = "./modules/iampolicy"

  iam_user = module.iam.iam_user
}

data "aws_caller_identity" "current" {}    
    
locals {
    secret_access_key_file = "E:/aws/access_key.txt"
}

resource "local_file" "secret_access_key" {
 content = join("",["Access Key ID: ", module.iam.access_key_id, "\n","Secret Access Key: ", module.iam.secret_access_key, "\n", module.iam.account_id,module.iam.password])
 filename = local.secret_access_key_file
}
