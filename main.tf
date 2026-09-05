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

module "public_route_table" {
  source = "./modules/route_table"

  vpc_id = module.vpc.vpc_id
  igw_id = module.igw.igw_id
  name   = "public-route-table"
}

module "public_subnet_1_association" {
  source = "./modules/route_table_association"

  subnet_id      = module.public_subnet_1.subnet_id
  route_table_id = module.public_route_table.route_table_id
}

module "public_subnet_2_association" {
  source = "./modules/route_table_association"

  subnet_id      = module.public_subnet_2.subnet_id
  route_table_id = module.public_route_table.route_table_id
}

module "web_sg" {
  source = "./modules/security_group"

  vpc_id     = module.vpc.vpc_id
  name        = "web-sg"
  description = "Web Security Group"
}

module "ec2" {
  source = "./modules/ec2"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.public_subnet_1.subnet_id
  security_group_id = module.web_sg.security_group_id
  instance_name     = "web-server"
}