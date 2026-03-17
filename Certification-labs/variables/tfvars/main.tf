provider "aws" {
    profile = "tf-user-personal-account"
    region = "us-east-1"
  
}

resource "aws_instance" "my_ec2" {
    ami = var.ami
    instance_type = var.instance_type
}