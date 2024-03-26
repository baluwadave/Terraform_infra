


terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-staging-environmet-backend"
    key = "Terraform/terraform.tfstate"
    region ="ap-south-1"
    dynamodb_table = "Terraform-server-backend"   
  }
}

provider "aws" {
    region = "ap-northeast-3"
    shared_config_files =["/root/.aws/config"]  
    shared_credentials_files = ["/root/.aws/credentials"]
    # profile = "balu"
}

# Use the EC2 instances module
module "my_instances" {
#   depends_on = [ module.vpc.public_subnet_id ]
  source = "./ec2_instance"
  instance_count = var.instance_count
  ami_id         = var.ami_id
  instance_type  = var.instance_type
  key_name       = var.key_name
  subnet_id = module.vpc.public_subnet_2a
  Terraform_sg = module.Terraform_sg.Terraform_sg
}


# module "my_instances1" {
# #   depends_on = [ module.vpc.public_subnet_id ]
#   source = "./ec2_instance"
#   instance_count = var.instance_count 
#   ami_id         = var.ami_id
#   instance_type  = var.instance_type
#   key_name       = var.key_name
#   subnet_id = module.vpc.public_subnet_2a
#   Terraform_sg = module.Terraform_sg.Terraform_sg
# }

# Other configurations can be added here
module "vpc" {
  source              = "./vpc"
  private_subnet_cidr = var.private_subnet_cidr
  public_subnet_cidr_1a  = var.public_subnet_cidr_1a
  public_subnet_cidr_2a = var.public_subnet_cidr_2a
  vpc_cidr            = var.vpc_cidr
}
module "Terraform_sg" {
  source = "./security_group"
  vpc_id = module.vpc.vpc_id
}



module "alb" {
  source = "./loadbalancer"
  name = var.name
  vpc_id = module.vpc.vpc_id
  subnet_ids = [module.vpc.public_subnet_2a]
  # security_group_ids = module.Terraform_sg.Terraform_sg.id
  protocol = var.protocol
  target_group_name = var.target_group_name
  security_group_ids = [module.Terraform_sg.Terraform_sg]
  # Terraform_sg = module.Terraform_sg.Terraform_sg
 # Replace with your security group IDs
}


resource "aws_lb_target_group_attachment" "target_attachment_module" {
  count            = min(length(module.my_instances.instance_ids), 2)
  target_group_arn = module.alb.target_group_arn
  target_id        = module.my_instances.instance_ids[count.index]
}

