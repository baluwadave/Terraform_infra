variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "vpc_id" { }

variable "subnet_ids" {
  description = "List of subnet IDs for the ALB"
  type        = list(string)
}

# variable "security_group_ids" {
#   description = "List of security group IDs for the ALB"
#   type        = list(string)  
# }

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "protocol" {
    type = string
}
# variable "instance_ids" {
    
# }