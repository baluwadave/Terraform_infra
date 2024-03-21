output "public_subnet_1a" {
  value = aws_subnet.public-subnet-1a.id
  description="This is my public subnet id"
}
output "public_subnet_2a" {
  value =aws_subnet.public-subnet-2a.id  
}

output "vpc_id" {
    value = aws_vpc.terraform-vpc.id
    description = "This is my vpc_id which i have created through s script"
}

output "subnet_id2" {
    value = aws_subnet.private-subnet.id
    description = "This is Private subnet id"
}



