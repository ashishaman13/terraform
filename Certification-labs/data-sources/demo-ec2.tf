terraform {
  required_version = "~>1.14.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>6.42"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "tf-user-personal-account"
}


data "aws_ami" "myimage" {
  most_recent = true
  owners      = ["309956199498"]

  filter {
    name   = "name"
    values = ["RHEL-9.*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.myimage.id
  instance_type = "t2.micro"
}

