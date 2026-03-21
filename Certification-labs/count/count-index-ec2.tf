provider "aws" {
    region = "us-east-1"
    profile = "tf-user-personal-account"
}

resource "aws_instance" "my_ec2" {
    ami = "ami-1234567890"
    instance_type = "t2.micro"
    count = 3
    tags = {
        Name = "order-instance-${count.index}"
    }
}