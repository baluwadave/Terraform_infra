output "My_instances" {
    value = aws_instance.My_instances.*.id
}

