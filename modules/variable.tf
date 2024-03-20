variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
  default     = 3
}

variable "ami_id" {
  description = "The ID of the AMI to use for EC2 instances"
}

variable "instance_type" {
  description = "The type of EC2 instance to create"
  default     = "t2.micro"
}

# Add more variables as needed
