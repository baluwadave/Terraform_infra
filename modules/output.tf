output "instance_ids" {
  description = "The IDs of the created EC2 instances"
  value       = module.my_instances[*].instance_ids
}

output "subnet_id1" {
  value = module.vpc.public_subnet_1a
  description="This is my public subnet id"
}

