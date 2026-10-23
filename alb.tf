resource "aws_lb" "this" {
  name               = var.load_balancer
  load_balancer_type = "application"
  internal           = false
  subnets            = [data.aws_subnet.public1.id, data.aws_subnet.public2.id]
  security_groups    = [data.aws_security_group.lb_http.id]

  tags = local.common_tags
}

# Blue/Green switch: only the weights change, nothing else is recreated
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.blue.arn
        weight = var.blue_weight
      }

      target_group {
        arn    = aws_lb_target_group.green.arn
        weight = var.green_weight
      }
    }
  }

  tags = local.common_tags
}
