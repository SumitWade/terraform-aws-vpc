module "vpc" {
  source   = "./modules/vpc"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
}
module "igw" {
  source = "./modules/internet_gateway"

  vpc_id = module.vpc.vpc_id
  name   = "main-igw"
}