output "instance_ids" {
  description = "The IDs of the created EC2 instances"
  value       = aws_instance.my_instances[*].id
}

output "public_ip_addresses" {
  description = "The public IP addresses of the created EC2 instances"
  value       = aws_instance.my_instances[*].public_ip
}

# Add more outputs as needed
    