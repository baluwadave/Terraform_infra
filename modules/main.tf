# Define AWS provider
provider "aws" {
  region = var.aws_region
}

# Use the EC2 instances module
module "ec2_instances" {
  source = "./modules/ec2_instances"

  instance_count = var.instance_count
  ami_id         = var.ami_id
  instance_type  = var.instance_type
}

# Other configurations can be added here
