
variable "instance_count" {
    type = number
    description = "This is about how many instance you want in your project"
}

variable "image_id" {
    type = string 
    description = "This is which iamge you want to for that project environment"
}

variable "instance_type" {
    type = string
    description = "Which type of insatance you want "    
    }

# variable "sg_id" {
#     type = list() 
#     description = "this is my security group to attach all instance"
# }


variable "key_name" {
    type = string
    description = "this is my key pair for accessing those instances"
}
# variable "subnet_id" {
#     type = string
#     description = "this is my public subnet which i want create my instances here"
# }

variable "project" {
    type = string
    description = "this is my project"
}

variable "environment" {
    type = string
    description = "this is my environment"
}
