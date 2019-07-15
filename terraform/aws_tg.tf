#####################################
# Target Group Settings
#####################################
resource "aws_lb_target_group" "target_group_app_main" {
  name     = "app-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_main.id
}

resource "aws_lb_target_group_attachment" "app_main1" {
  target_group_arn = aws_lb_target_group.target_group_app_main.arn
  target_id        = aws_instance.app_main1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "app_main2" {
  target_group_arn = aws_lb_target_group.target_group_app_main.arn
  target_id        = aws_instance.app_main2.id
  port             = 80
}
