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

output "public_route_table_id" {
  value = module.public_route_table.route_table_id
}

output "security_group_id" {
  value = module.web_sg.security_group_id
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "instance_public_ip" {
  value = module.ec2.public_ip
}