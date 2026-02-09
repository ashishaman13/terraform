provider "aws" {
  region     = "us-east-1"
  profile = "terraform-user"
}

resource "aws_instance" "myec2" {
    ami = "ami-0bb7267a511c0a8e8"
    instance_type = "t4g.micro"

    tags = {
        "Name" = "my_first_terraform_ec2"
    }
}