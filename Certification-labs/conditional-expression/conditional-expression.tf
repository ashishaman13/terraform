provider "aws" {
  region  = "us-east-1"
  profile = "tf-user-personal-account"

}

variable "environment" {
  default = "production"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-098e39bafa7e7303d"
  instance_type = var.environment == "development" ? "t2.micro" : "m5.large"
}

# Using not EQUALS
resource "aws_instance" "my_ec2" {
  ami           = "ami-098e39bafa7e7303d"
  instance_type = var.environment != "devlopment" ? "t2.micro" : "m5.large"
}

# Empty value based example
variable "env" {
  default = ""
}

resource "aws_instance" "name" {
  ami           = "ami-098e39bafa7e7303d"
  instance_type = var.env == "" ? "t2.micro" : "m5.xlarge"
}

# With Multiple Variable
variable "environment" {
  default = ""

}

variable "region" {
  default = "us-east-1"
}

resource "aws_instance" "my_ec2" {
  ami           = "ami-098e39bafa7e7303d"
  instance_type = var.environment == "production" && var.region == "us-east-1" ? "m5.large" : "t2.micro"
}