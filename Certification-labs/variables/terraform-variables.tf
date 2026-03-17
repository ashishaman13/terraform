provider "aws" {
  region  = "us-east-1"
  profile = "tf-user-personal-account"
}


resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"
  description = "Managed from terraform"
  tags = {
    Name       = "allow_tls",
    Maintainer = "Managed by terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_port" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.app_port
  to_port           = var.app_port
}

resource "aws_vpc_security_group_ingress_rule" "ssh_port" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.ssh_port
  to_port           = var.ssh_port
}

resource "aws_vpc_security_group_ingress_rule" "ftp_port" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip
  from_port         = var.ftp_port
  to_port           = var.ftp_port
}
