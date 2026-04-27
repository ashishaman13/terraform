variable "sg_ports_2" {
    type = list(number)
    default = [ 22, 3306, 5432, 6379 ]
}

resource "aws_security_group" "sg_2" {
    name = "sameple-sg"

    dynamic "ingress" {
        for_each = var.sg_ports_2

        content {
          
        }
      
    }
}