resource "aws_security_group" "Terraform-sg" {
  name        = "Terrafrom-sg"
  description = "security group allowing traffic on multiple ports"

  vpc_id = var.vpc # Replace with your VPC ID

  tags = {
    Name="Terraform-sg"
  }

  # Ingress rules
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = 20
      to_port     = 65000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]  # Allowing traffic from any IPv4 address, you may need to adjust this
    }
  }

  # Egress rules (Allow all traffic out)
  dynamic "egress" {
    for_each = var.ports
        content {
      from_port   = 20
      to_port     = 65000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]  # Allowing traffic from any IPv4 address, you may need to adjust this
    }
    
  }
#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
}
