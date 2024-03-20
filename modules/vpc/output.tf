output "public_subnet_id" {
  value = aws_subnet.public-subnet.id
  description="This is my public subnet id"
}

output "vpc" {
    value = aws_vpc.terraform-vpc.id
    description = "This is my vpc_id which i have created through s script"
}

output "subnet_id2" {
    value = aws_subnet.private-subnet.id
    description = "This is Private subnet id"
}



