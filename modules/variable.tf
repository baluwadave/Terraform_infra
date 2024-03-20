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


# variable "aws_region" {
#     description = "This is region where instance want to be create"
#     default = "ap-northeast-3"
  
# }

# Add more variables as needed
