#####################################
# EC2 Settings
#####################################
resource "aws_instance" "app_main1" {
    ami           = var.ami
    associate_public_ip_address = "true"
    instance_type = "t2.micro"
    key_name      = "${var.my_public_key}"
    subnet_id     = "${aws_subnet.vpc_main-public-subnet1.id}"
    vpc_security_group_ids = ["${aws_security_group.app_sg.id}"]
    iam_instance_profile = "ec2-role"
    user_data = <<EOF
    IyEvYmluL3NoDQoNCmF3cz0iL3Vzci9iaW4vYXdzIC0tcmVnaW9uIGFwLW5vcnRoZWFzdC0xIg0KbG9nZ2VyPSJsb2dnZXIgLXQgJDAiDQoNCmdldF9pbnN0YW5jZV9pZCgpDQp7DQogICAgaW5zdGFuY2VfaWQ9JChjdXJsIC1zIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9pbnN0YW5jZS1pZCkNCn0NCg0KZ2V0X3JlZGlzX2VuZHBvaW50KCkNCnsNCiAgICByZWRpc19lbmRwb2ludD0kKCR7YXdzfSBlYzIgZGVzY3JpYmUtaW5zdGFuY2VzIFwNCiAgICAgICAgICAgICAgICAgIC0taW5zdGFuY2UtaWQgJHtpbnN0YW5jZV9pZH0gXA0KICAgICAgICAgICAgICAgICAgLS1xdWVyeSAnUmVzZXJ2YXRpb25zW10uSW5zdGFuY2VzW10uVGFnc1s/S2V5PT1gUmVkaXNfZW5kcG9pbnRgXS5WYWx1ZScgXA0KICAgICAgICAgICAgICAgICAgLS1vdXRwdXQgdGV4dCkNCn0NCg0Kc2V0X3JlZGlzX2VuZHBvaW50KCkNCnsNCiAgICBzZWQgLWkgLWUgInMvUkVESVNfSE9TVC4qJC9SRURJU19IT1NUOiAnJHtyZWRpc19lbmRwb2ludH0nL2ciIGRvY2tlci1jb21wb3NlLnltbA0KfQ0KDQoke2xvZ2dlcn0gInN0YXJ0ICQwIg0KDQoke2xvZ2dlcn0gImluc3RhbGwgZG9ja2VyIGFuZCBkb2NrZXItY29tcG9zZSINCnl1bSAteSBpbnN0YWxsIGRvY2tlcg0Kc3lzdGVtY3RsIHN0YXJ0IGRvY2tlcg0Kc3lzdGVtY3RsIGVuYWJsZSBkb2NrZXINCmN1cmwgLUwgImh0dHBzOi8vZ2l0aHViLmNvbS9kb2NrZXIvY29tcG9zZS9yZWxlYXNlcy9kb3dubG9hZC8xLjI0LjAvZG9ja2VyLWNvbXBvc2UtJCh1bmFtZSAtcyktJCh1bmFtZSAtbSkiIC1vIC91c3IvbG9jYWwvYmluL2RvY2tlci1jb21wb3NlDQpjaG1vZCAreCAvdXNyL2xvY2FsL2Jpbi9kb2NrZXItY29tcG9zZQ0KDQoke2xvZ2dlcn0gImluc3RhbGwgYXBwIg0KeXVtIC15IGluc3RhbGwgZ2l0DQpjZCB+DQpnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL3RldHNpcy9zaW1wbGUtY2hhdC5naXQNCmNkIHNpbXBsZS1jaGF0DQoNCiR7bG9nZ2VyfSAiZ2V0IGluZm8iDQpnZXRfaW5zdGFuY2VfaWQNCmdldF9yZWRpc19lbmRwb2ludA0KDQoke2xvZ2dlcn0gInNldCBlbnZpcm9ubWVudCINCnNldF9yZWRpc19lbmRwb2ludA0KDQoke2xvZ2dlcn0gInJ1biBhcHAiDQpkb2NrZXItY29tcG9zZSB1cCAtZA0KDQoke2xvZ2dlcn0gImZpbmlzaGVkICQwIg0KDQpleGl0IDA=
EOF

    tags = {
        Name = "${var.app_name} instance 1",
        Redis_endpoint = "${aws_elasticache_replication_group.elasticache_main.primary_endpoint_address}"
    }
}

resource "aws_instance" "app_main2" {
    ami           = var.ami
    associate_public_ip_address = "true"
    instance_type = "t2.micro"
    key_name      = "${var.my_public_key}"
    subnet_id     = "${aws_subnet.vpc_main-public-subnet2.id}"
    vpc_security_group_ids = ["${aws_security_group.app_sg.id}"]
    iam_instance_profile = "ec2-role"
    user_data = <<EOF
    IyEvYmluL3NoDQoNCmF3cz0iL3Vzci9iaW4vYXdzIC0tcmVnaW9uIGFwLW5vcnRoZWFzdC0xIg0KbG9nZ2VyPSJsb2dnZXIgLXQgJDAiDQoNCmdldF9pbnN0YW5jZV9pZCgpDQp7DQogICAgaW5zdGFuY2VfaWQ9JChjdXJsIC1zIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9pbnN0YW5jZS1pZCkNCn0NCg0KZ2V0X3JlZGlzX2VuZHBvaW50KCkNCnsNCiAgICByZWRpc19lbmRwb2ludD0kKCR7YXdzfSBlYzIgZGVzY3JpYmUtaW5zdGFuY2VzIFwNCiAgICAgICAgICAgICAgICAgIC0taW5zdGFuY2UtaWQgJHtpbnN0YW5jZV9pZH0gXA0KICAgICAgICAgICAgICAgICAgLS1xdWVyeSAnUmVzZXJ2YXRpb25zW10uSW5zdGFuY2VzW10uVGFnc1s/S2V5PT1gUmVkaXNfZW5kcG9pbnRgXS5WYWx1ZScgXA0KICAgICAgICAgICAgICAgICAgLS1vdXRwdXQgdGV4dCkNCn0NCg0Kc2V0X3JlZGlzX2VuZHBvaW50KCkNCnsNCiAgICBzZWQgLWkgLWUgInMvUkVESVNfSE9TVC4qJC9SRURJU19IT1NUOiAnJHtyZWRpc19lbmRwb2ludH0nL2ciIGRvY2tlci1jb21wb3NlLnltbA0KfQ0KDQoke2xvZ2dlcn0gInN0YXJ0ICQwIg0KDQoke2xvZ2dlcn0gImluc3RhbGwgZG9ja2VyIGFuZCBkb2NrZXItY29tcG9zZSINCnl1bSAteSBpbnN0YWxsIGRvY2tlcg0Kc3lzdGVtY3RsIHN0YXJ0IGRvY2tlcg0Kc3lzdGVtY3RsIGVuYWJsZSBkb2NrZXINCmN1cmwgLUwgImh0dHBzOi8vZ2l0aHViLmNvbS9kb2NrZXIvY29tcG9zZS9yZWxlYXNlcy9kb3dubG9hZC8xLjI0LjAvZG9ja2VyLWNvbXBvc2UtJCh1bmFtZSAtcyktJCh1bmFtZSAtbSkiIC1vIC91c3IvbG9jYWwvYmluL2RvY2tlci1jb21wb3NlDQpjaG1vZCAreCAvdXNyL2xvY2FsL2Jpbi9kb2NrZXItY29tcG9zZQ0KDQoke2xvZ2dlcn0gImluc3RhbGwgYXBwIg0KeXVtIC15IGluc3RhbGwgZ2l0DQpjZCB+DQpnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL3RldHNpcy9zaW1wbGUtY2hhdC5naXQNCmNkIHNpbXBsZS1jaGF0DQoNCiR7bG9nZ2VyfSAiZ2V0IGluZm8iDQpnZXRfaW5zdGFuY2VfaWQNCmdldF9yZWRpc19lbmRwb2ludA0KDQoke2xvZ2dlcn0gInNldCBlbnZpcm9ubWVudCINCnNldF9yZWRpc19lbmRwb2ludA0KDQoke2xvZ2dlcn0gInJ1biBhcHAiDQpkb2NrZXItY29tcG9zZSB1cCAtZA0KDQoke2xvZ2dlcn0gImZpbmlzaGVkICQwIg0KDQpleGl0IDA=
EOF

    tags = {
        Name = "${var.app_name} instance 2",
        Redis_endpoint = "${aws_elasticache_replication_group.elasticache_main.primary_endpoint_address}"
    }
}
