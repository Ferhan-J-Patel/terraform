output "vpc_output" {
  value = module.vpc.*
}

output "sg_output" {
  value = module.sg.*
}

output "ec2_output" {
  value = module.ec2.*
}

output "pem_key" {
    value = module.key_pair.*
    sensitive = true
}

output "iam" {
value = module.iam.*
sensitive = true
}
  
output "ac_id" {
  value = data.aws_caller_identity.current.account_id
}
