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
    region = "us-east-1"
    profile = "tf-user-personal-account"
}

variable "db_password" {
    type = string
    validation {
      condition = length(var.db_password) >= 12
      error_message = "Length of Database password must be greater than or equal to 12 char"
    }
}