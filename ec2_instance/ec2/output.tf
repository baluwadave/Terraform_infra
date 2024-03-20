output "My_instances" {
    value = aws_instance.My_instances[0].id
}

output "instances" {
    value = aws_instance.My_instances[1].id
}