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
    ami = "ami-0ec10929233384c7f"
    instance_type = "t3.micro"

    tags = {
      "Name" = "HelloEarth_ec2"
    }

    lifecycle {
      create_before_destroy = true
    }
}