output "instance_ids" {
    value = aws_instance.My_instances[*].id
}
