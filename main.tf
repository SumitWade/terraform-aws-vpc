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

module "public_subnet_1" {
  source = "./modules/subnet"

  vpc_id            = module.vpc.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1a"
  public_ip         = true
  name              = "public-subnet-1"
}

module "public_subnet_2" {
  source = "./modules/subnet"

  vpc_id            = module.vpc.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-south-1b"
  public_ip         = true
  name              = "public-subnet-2"
}