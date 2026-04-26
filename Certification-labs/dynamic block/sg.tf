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

# variable "sg_ports" {
#     type = list(number)
#     default = [ 80, 443, 22, 3306, 5732, 6379 ]
# }

locals {
  allowed_ip = "203.0.113.10/32"

  ingress_rules = {
    http  = { port = 80,   description = "HTTP"       }
    https = { port = 443,  description = "HTTPS"      }
    ssh   = { port = 22,   description = "SSH"        }
    mysql = { port = 3306, description = "MySQL"      }
    pg    = { port = 5432, description = "PostgreSQL" }
    redis = { port = 6379, description = "Redis"      }   
  }
}

resource "aws_security_group" "sg" {
    name = "sample-sg"

    dynamic "ingress" {
        for_each = local.ingress_rules

        content {
            from_port   = ingress.value.port
            to_port     = ingress.value.port
            protocol    = "tcp"
            cidr_blocks = [local.allowed_ip]
        }   
    }  
}
