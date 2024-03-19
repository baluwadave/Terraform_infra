resource "aws_instance" "My_instances" {
    count =   var.instance_count
    ami =var.image_id
    instance_type = var.instance_type
    # vpc_security_group_ids = var.sg_id
    key_name = var.key_name
    # subnet_id = var.subnet_id
    tags = {
      Name= var.project
      environmet=var.environment
    }
  
}