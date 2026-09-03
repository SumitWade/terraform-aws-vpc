output "vpc_id" {
  value = module.vpc.vpc_id
}
output "igw_id" {
  value = module.igw.igw_id
}
output "public_subnet_1_id" {
  value = module.public_subnet_1.subnet_id
}

output "public_subnet_2_id" {
  value = module.public_subnet_2.subnet_id
}