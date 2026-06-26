Terraform Dynamic Block in AWS

A dynamic block is used when a resource contains repeated nested blocks (such as ingress, egress, ebs_block_device, subnet_mapping, etc. Think of it as a for_each loop for nested blocks

example 

variable "ingress_rules" {
  type = list(object({
    port        = number
    description = string
  }))

  default = [
    {
      port        = 22
      description = "SSH"
    },
    {
      port        = 80
      description = "HTTP"
    },
    {
      port        = 443
      description = "HTTPS"
    }
  ]
}



main.tf 


resource "aws_security_group" "web" {
  name = "web-sg"

  dynamic "ingress" {
    for_each = var.ingress_rules

    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = ingress.value.description
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
