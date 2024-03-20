output "instance_ids" {
  description = "The IDs of the created EC2 instances"
  value       = module.my_instances[*].instance_ids
}

# output "public_ip_addresses" {
#   description = "The public IP addresses of the created EC2 instances"
#   value       = module.my_instances[*].public_ip
# }

# Add more outputs as needed
output "subnet_id1" {
  value = module.terraform_vpc.public_subnet_id
  description="This is my public subnet id"
}