variable "aws_region" {
  default = "ap-south-1"
}

variable "vpc_name" {
  default = "terraform-vpc"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "ami_id" {
  default = "ami-0f918f7e67a3323f0"
}

variable "instance_type" {
  default = "t2.micro"
}