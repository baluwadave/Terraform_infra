output "instance_ids" {
  description = "The IDs of the created EC2 instances"
  value       = aws_instance.my_instances[*].id 
}
    