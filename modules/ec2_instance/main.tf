# Define EC2 instances
resource "aws_instance" "my_instances" {
#   depends_on = [ vpc.subnet_id]
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id =var.subnet_id
  vpc_security_group_ids = [var.Terraform_sg]
  key_name = var.key_name
  associate_public_ip_address = true
  user_data = file("${path.modules}/user_data_script.sh")

  tags = {
    Name = "Instance-${count.index}"
  }
}
