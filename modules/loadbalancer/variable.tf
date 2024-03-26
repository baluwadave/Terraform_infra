variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "vpc_id" {
    type = string
 }

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the ALB"
  type        = list(string)  
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "protocol" {
    type = string
}
# variable "instance_ids" {
    
# }



# variable "instance_count" {
#   description = "The number of EC2 instances to create"
#   type        = number
#   default     = 3
# }

# variable "ami_id" {
#   description = "The ID of the AMI to use for EC2 instances"
#   default = "ami-021a9d8a7dda97aa5"
# }

# variable "instance_type" {
#   description = "The type of EC2 instance to create"
#   default     = "t3.micro"
# }
# variable "key_name" {
#     default = "pair"
#     description = "This is my key in that region"
# }



variable "subnet_id" {
  type = string
  description = "This is subnet created while created vpc"
}

# variable "Terraform_sg" {
#   type = string
# }