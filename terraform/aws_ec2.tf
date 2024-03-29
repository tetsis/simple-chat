#####################################
# EC2 Settings
#####################################
resource "aws_instance" "app_main1" {
    ami           = var.ami
    associate_public_ip_address = "true"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.vpc_main-public-subnet1.id
    vpc_security_group_ids = [aws_security_group.app_sg.id]
    iam_instance_profile = "ec2-role"
    user_data = <<EOF
IyEvYmluL3NoDQoNCmF3cz0iL3Vzci9iaW4vYXdzIC0tcmVnaW9uIGFwLW5vcnRoZWFzdC0xIg0KbG9nZ2VyPSJsb2dnZXIgLXQgJDAiDQoNCmdldF9pbnN0YW5jZV9pZCgpDQp7DQogICAgaW5zdGFuY2VfaWQ9JChjdXJsIC1zIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9pbnN0YW5jZS1pZCkNCn0NCg0KZ2V0X3JlZGlzX2VuZHBvaW50KCkNCnsNCiAgICByZWRpc19lbmRwb2ludD0kKCR7YXdzfSBlYzIgZGVzY3JpYmUtaW5zdGFuY2VzIFwNCiAgICAgICAgICAgICAgICAgIC0taW5zdGFuY2UtaWQgJHtpbnN0YW5jZV9pZH0gXA0KICAgICAgICAgICAgICAgICAgLS1xdWVyeSAnUmVzZXJ2YXRpb25zW10uSW5zdGFuY2VzW10uVGFnc1s/S2V5PT1gUmVkaXNfZW5kcG9pbnRgXS5WYWx1ZScgXA0KICAgICAgICAgICAgICAgICAgLS1vdXRwdXQgdGV4dCkNCn0NCg0Kc2V0X3JlZGlzX2VuZHBvaW50KCkNCnsNCiAgICBzZWQgLWkgLWUgInMvUkVESVNfSE9TVC4qJC9SRURJU19IT1NUOiAnJHtyZWRpc19lbmRwb2ludH0nL2ciIGRvY2tlci1jb21wb3NlLnltbA0KfQ0KDQoke2xvZ2dlcn0gInN0YXJ0ICQwIg0Kc2xlZXAgNjANCg0KJHtsb2dnZXJ9ICJnZXQgaW5mbyINCmdldF9pbnN0YW5jZV9pZA0KZ2V0X3JlZGlzX2VuZHBvaW50DQoNCiR7bG9nZ2VyfSAic2V0IGVudmlyb25tZW50Ig0KY2QgL3Jvb3Qvc2ltcGxlLWNoYXQNCnNldF9yZWRpc19lbmRwb2ludA0KDQoke2xvZ2dlcn0gInJ1biBhcHAiDQpkb2NrZXItY29tcG9zZSB1cCAtZA0KDQoke2xvZ2dlcn0gImZpbmlzaGVkICQwIg0KDQpleGl0IDANCg==
EOF

    tags = {
        Name = "${var.app_name} instance 1",
        Redis_endpoint = aws_elasticache_replication_group.elasticache_main.primary_endpoint_address
    }
}

resource "aws_instance" "app_main2" {
    ami           = var.ami
    associate_public_ip_address = "true"
    instance_type = "t2.micro"
    subnet_id     = aws_subnet.vpc_main-public-subnet2.id
    vpc_security_group_ids = [aws_security_group.app_sg.id]
    iam_instance_profile = "ec2-role"
    user_data = <<EOF
IyEvYmluL3NoDQoNCmF3cz0iL3Vzci9iaW4vYXdzIC0tcmVnaW9uIGFwLW5vcnRoZWFzdC0xIg0KbG9nZ2VyPSJsb2dnZXIgLXQgJDAiDQoNCmdldF9pbnN0YW5jZV9pZCgpDQp7DQogICAgaW5zdGFuY2VfaWQ9JChjdXJsIC1zIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9pbnN0YW5jZS1pZCkNCn0NCg0KZ2V0X3JlZGlzX2VuZHBvaW50KCkNCnsNCiAgICByZWRpc19lbmRwb2ludD0kKCR7YXdzfSBlYzIgZGVzY3JpYmUtaW5zdGFuY2VzIFwNCiAgICAgICAgICAgICAgICAgIC0taW5zdGFuY2UtaWQgJHtpbnN0YW5jZV9pZH0gXA0KICAgICAgICAgICAgICAgICAgLS1xdWVyeSAnUmVzZXJ2YXRpb25zW10uSW5zdGFuY2VzW10uVGFnc1s/S2V5PT1gUmVkaXNfZW5kcG9pbnRgXS5WYWx1ZScgXA0KICAgICAgICAgICAgICAgICAgLS1vdXRwdXQgdGV4dCkNCn0NCg0Kc2V0X3JlZGlzX2VuZHBvaW50KCkNCnsNCiAgICBzZWQgLWkgLWUgInMvUkVESVNfSE9TVC4qJC9SRURJU19IT1NUOiAnJHtyZWRpc19lbmRwb2ludH0nL2ciIGRvY2tlci1jb21wb3NlLnltbA0KfQ0KDQoke2xvZ2dlcn0gInN0YXJ0ICQwIg0Kc2xlZXAgNjANCg0KJHtsb2dnZXJ9ICJnZXQgaW5mbyINCmdldF9pbnN0YW5jZV9pZA0KZ2V0X3JlZGlzX2VuZHBvaW50DQoNCiR7bG9nZ2VyfSAic2V0IGVudmlyb25tZW50Ig0KY2QgL3Jvb3Qvc2ltcGxlLWNoYXQNCnNldF9yZWRpc19lbmRwb2ludA0KDQoke2xvZ2dlcn0gInJ1biBhcHAiDQpkb2NrZXItY29tcG9zZSB1cCAtZA0KDQoke2xvZ2dlcn0gImZpbmlzaGVkICQwIg0KDQpleGl0IDANCg==
EOF

    tags = {
        Name = "${var.app_name} instance 2",
        Redis_endpoint = aws_elasticache_replication_group.elasticache_main.primary_endpoint_address
    }
}
