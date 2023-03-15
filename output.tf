output "vpc_output" {
  value = module.vpc.*
}

output "sg_output" {
  value = module.sg.*
}

output "ec2_output" {
  value = module.ec2.*
}