resource "aws_lb" "alb" {
  name               = var.name
  internal           = false
  load_balancer_type = "application"
  # security_groups  =   var.security_group_ids
  subnets            = var.subnet_ids
  # vpc_id =var.vpc_id
  enable_deletion_protection = false
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = var.protocol

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Hello from ALB!"
      status_code  = "200"
    }
  }

    }


resource "aws_lb_target_group" "target_group" {
  name        = var.target_group_name
  port        = 80
  protocol    = var.protocol
  vpc_id      = var.vpc_id
  target_type = "instance"
}

resource "aws_lb_target_group_attachment" "target_attachment" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_lb_target_group.target_group.id  # Replace with your target instance ID
}