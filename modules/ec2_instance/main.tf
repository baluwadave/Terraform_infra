# Define EC2 instances
resource "aws_instance" "my_instances" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "Instance-${count.index}"
  }
}
