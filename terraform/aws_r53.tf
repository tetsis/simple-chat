resource "aws_route53_record" "app_domain" {
    zone_id = var.zone_id
    name = var.app_fqdn
    type = "A"
    alias {
        name                   = aws_alb.app_alb.dns_name
        zone_id                = aws_alb.app_alb.zone_id
        evaluate_target_health = true
    }
}
