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

variable "user_names" {
    type = set(string)
    default = [ "alice","bob","john" ]
}

# resource "aws_iam_user" "this" {
#     name = "alice"
# }

# resource "aws_iam_user" "this" {
#     name = "bob"
# }

# resource "aws_iam_user" "this" {
#     name = "john"
# }

resource "aws_iam_user" "this" {
    for_each = var.user_names
    name = each.value
}

variable "my-map" {
    type = map(string)
    default = {
      "dev" = "ami-1234"
      "prod" = "ami-123"
    }
}

resource "aws_instance" "myec2" {
    for_each = var.my-map
    ami = each.value
    instance_type = "t2.micro"
    tags_all = {
      Name = each.key
    }
}

variable "my-object" {
    type = object({
      Name = string
      userID = number
    })
}
