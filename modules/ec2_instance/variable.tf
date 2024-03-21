variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
  default     = 3
}

variable "ami_id" {
  description = "The ID of the AMI to use for EC2 instances"
  default = "ami-021a9d8a7dda97aa5"
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  default     = "t2.micro"
}
variable "key_name" {
    default = "pair"
    description = "This is my key in that region"
}



variable "subnet_id" {
  description = "This is subnet created while created vpc"
}

variable "Terraform_sg" {
  type = string
}