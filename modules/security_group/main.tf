resource "aws_security_group" "Terraform-sg" {
  name        = "Terrafrom-sg"
  description = "security group allowing traffic on multiple ports"

  vpc_id = var.vpc # Replace with your VPC ID

  # Ingress rules
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]  # Allowing traffic from any IPv4 address, you may need to adjust this
    }
  }

  # Egress rules (Allow all traffic out)
  dynamic "egress" {
    for_each = var.ports
        content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]  # Allowing traffic from any IPv4 address, you may need to adjust this
    }
    
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
