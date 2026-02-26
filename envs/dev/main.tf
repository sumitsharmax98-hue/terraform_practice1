provider "aws" {
  region = "us-east-1"
}

# Backend config
terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-123"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

# VPC
module "vpc" {
  source         = "../../modules/vpc"
  cidr           = "10.0.0.0/16"
  public_subnet  = "10.0.1.0/24"
}

# EC2
module "ec2" {
  source         = "../../modules/ec2"
  ami            = "ami-0abcdef1234567890"
  instance_type  = "t2.micro"
  subnet_id      = module.vpc.subnet_id
}