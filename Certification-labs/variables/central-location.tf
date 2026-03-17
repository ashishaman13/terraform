variable "vpn_ip" {
  default     = "200.20.30.50/32"
  description = "This is a vpn server created in AWS"
}

variable "ftp_port" {
  default = "21"
}

variable "app_port" {
  default = "80"
}

variable "ssh_port" {
  default = "22"
}