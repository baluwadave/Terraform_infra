variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
  default     = 6
}

variable "ami_id" {
  description = "The ID of the AMI to use for EC2 instances"
  default = "ami-021a9d8a7dda97aa5"
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  default     = "t3.micro"
}


variable "key_name" {
    default = "pair"
    description = "This is My key pair for this region"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}


variable "private_subnet_cidr" {
  default = "10.0.1.0/24"
}
variable "public_subnet_cidr_1a" {
  default = "10.0.2.0/24"
  
}
variable "public_subnet_cidr_2a" {
  default = "10.0.3.0/24"
}

variable "name" {
  default = "Terraform-alb"
}

variable "protocol" {
  default = "HTTP"
}

variable "target_group_name" {
  default = "Terraform-target-group"
}