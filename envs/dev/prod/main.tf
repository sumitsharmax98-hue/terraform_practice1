provider "aws" {
  region     = "us-east-1"
  access_key = "dummy"
  secret_key = "dummy"
}

module "ec2" {
  source        = "../../modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
}