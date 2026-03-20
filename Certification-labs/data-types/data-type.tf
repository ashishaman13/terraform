provider "aws" {
    region = "us-east-1"
    profile = "tf-user-personal-account"
}

variable "iam_user" {
    type = number
}

resource "aws_iam_user" "my_user" {
    name = var.iam_user
}