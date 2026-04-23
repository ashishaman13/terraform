provider "aws" {
    region = "us-east-1"
    profile = "tf-user-personal-account"
}

resource "aws_instance" "my_ec2" {
    ami = "ami-098e39bafa7e7303d"
    instance_type = "t2.micro"
    count = 3
    tags = {
        Name = "order-instance-${count.index}"
    }
}

# 2nd use-case is IAM user, identical user-name is not allowed, so count-index can solve

resource "aws_iam_user" "This" {
    name = "read-only-user-${count.index}"
    count = 2
}

# 3rd use-case is not every time we want name to be like - "read-only-user-0","read-only-user-1"

variable "user_name" {
  type = list
  default = ["DevTeam","TestTeam","ProdTeam"]
}

resource "aws_iam_user" "this" {
    count = 3
    name = var.user_name[count.index]
  
}