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

resource "aws_security_group" "payments_db_firewall" {
    name = "db_firewall"
  
}

moved {
  from = aws_security_group.db_firewall
  to = aws_security_group.payments_db_firewall
}