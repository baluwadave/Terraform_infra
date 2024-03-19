module "ec2_instance" {
    source = "./ec2_instance/ec2"
    count = 4
    ami =var.image_id
    instance_type = var.instance_type
    # vpc_security_group_ids = var.sg_id
    key_name = var.key_name    
}