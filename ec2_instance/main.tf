
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.41.0"
    }
  }
}



provider "aws" {
    region = "ap-northeast-3"
    shared_config_files =["/root/.aws/config"]  
    shared_credentials_files = ["/root/.aws/credentials"]
    # profile = "balu"
}


terraform {
  backend "s3" {
    bucket = "terraform-staging-environmet-backend"
    key = "Terraform/terraform.tfstate"
    region ="ap-south-1"
    dynamodb_table = "Terraform-server-backend"   
  }
}







module "My_instances" {
    source = "./ec2"
    instance_count= 4
    image_id ="ami-021a9d8a7dda97aa5"
    instance_type = "t2.micro"
    # vpc_security_group_ids = var.sg_id
    key_name = "pair"
    project= "Terraform" 
    environment="Terraform-staging"
}