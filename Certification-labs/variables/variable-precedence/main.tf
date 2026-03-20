provider "aws" {
    region = "us-east-1"
    profile = "tf-user-personal-account"
}

resource "aws_instance" "vraible-instance" {
    ami = "ami-0bb7267a511c0a8e8"
    instance_type = var.instance_type
  
}