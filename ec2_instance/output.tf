output "instances" {
    value = aws_instance.My_instances[*].id
}
