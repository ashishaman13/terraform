terraform {
  required_version = "~>1.14.9"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.42"
    }
  }
}

provider "aws" {
    profile = "tf-user-personal-account"
    region = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0bb7267a511c0a8e8"
    instance_type = "t2.mircro"
}