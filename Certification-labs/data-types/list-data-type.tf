variable "security_group_id" {
  type = list(number)
}

resource "aws_instance" "my_ec2" {
    ami = "ami-1234567890"
    vpc_security_group_ids = var.security_group_id  
}