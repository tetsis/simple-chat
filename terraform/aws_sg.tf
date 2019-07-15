resource "aws_security_group" "app_sg" {
    name = "app_sg"
    vpc_id = aws_vpc.vpc_main.id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.allow_ip]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [var.allow_ip, var.root_segment]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    description = "allow 22/tcp, 80/tcp"

    tags = {
        Name = "${var.app_name} app_sg"
    }
}

resource "aws_security_group" "elasticache_sg" {
    name = "elasticache_sg"
    vpc_id = aws_vpc.vpc_main.id
    ingress {
        from_port = 6379
        to_port = 6379
        protocol = "tcp"
        cidr_blocks = [var.public_segment1, var.public_segment2]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    description = "allow 6379/tcp (Redis) from public subnets"

    tags = {
        Name = "${var.app_name} elasticache_sg"
    }
}

resource "aws_security_group" "alb_sg" {
    name = "alb_sg"
    vpc_id = aws_vpc.vpc_main.id
    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [var.allow_ip]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    description = "allow 443/tcp for ALB"

    tags = {
        Name = "${var.app_name} alb_sg"
    }
}