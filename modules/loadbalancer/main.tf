resource "aws_alb" "alb" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  security_groups  =   var.security_group_ids
  subnets            = var.subnet_ids
#  depends_on = [ vpc.vpc_id ]
# vpc_id =var.vpc_id
  enable_deletion_protection = false
}

resource "aws_instance" "my_instances2" {
#   depends_on = [ vpc.subnet_id]
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id =var.subnet_id
  vpc_security_group_ids = [var.Terraform_sg]
  key_name = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "Instance-${count.index}"
  }
}






resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_alb.alb.arn
  port              = 80
  protocol          = var.protocol

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }

  
  }


resource "aws_lb_target_group" "target_group" {
  name        = var.target_group_name
  port        = 80
  protocol    = var.protocol
  vpc_id      = var.vpc_id  
  target_type = "instance"
    health_check {
    enabled             = true
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-499"
  }

}


# resource "aws_lb_target_group_attachment" "target_attachment" {
#   # count = length(module.my_instances1.instance_ids)
#   target_group_arn = aws_lb_target_group.target_group.arn
#   target_id        = aws_lb_target_group.target_group.id # Replace with your target instance ID
# }

resource "aws_lb_target_group_attachment" "target_attachment" {
  
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = "aws_instance.my_instances2[count.index]"
  // Replace "aws_instance.example.id" with the correct instance ID of your EC2 instance
}
