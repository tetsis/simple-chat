#####################################
# ALB Settings
#####################################
resource "aws_alb" "app_alb" {
    name                       = "${var.app_name}-alb"
    security_groups            = [aws_security_group.alb_sg.id]
    subnets                    = [aws_subnet.vpc_main-public-subnet1.id, aws_subnet.vpc_main-public-subnet2.id]
    internal                   = false
    enable_deletion_protection = false
}

#####################################
# ALB Listener Settings
#####################################
resource "aws_alb_listener" "alb" {
    load_balancer_arn = aws_alb.app_alb.arn
    port              = "443"
    protocol          = "HTTPS"
    ssl_policy        = "ELBSecurityPolicy-2016-08"
    certificate_arn   = aws_acm_certificate_validation.cert.certificate_arn

    default_action {
      target_group_arn = aws_lb_target_group.target_group_app_main.arn
      type             = "forward"
    }
}
