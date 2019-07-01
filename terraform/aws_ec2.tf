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
    user_data = <<EOF
    IyEvYmluL3NoDQoNCmF3cz0iL3Vzci9iaW4vYXdzIC0tcmVnaW9uIGFwLW5vcnRoZWFzdC0xIg0KbG9nZ2VyPSJsb2dnZXIgLXQgJDAiDQoNCmdldF9pbnN0YW5jZV9pZCgpDQp7DQogICAgaW5zdGFuY2VfaWQ9JChjdXJsIC1zIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9pbnN0YW5jZS1pZCkNCn0NCg0KZ2V0X3JlZGlzX2VuZHBvaW50KCkNCnsNCiAgICByZWRpc19lbmRwb2ludD0kKCR7YXdzfSBlYzIgZGVzY3JpYmUtaW5zdGFuY2VzIFwNCiAgICAgICAgICAgICAgICAgIC0taW5zdGFuY2UtaWQgJHtpbnN0YW5jZV9pZH0gXA0KICAgICAgICAgICAgICAgICAgLS1xdWVyeSAnUmVzZXJ2YXRpb25zW10uSW5zdGFuY2VzW10uVGFnc1s/S2V5PT1gUmVkaXNfZW5kcG9pbnRgXS5WYWx1ZScgXA0KICAgICAgICAgICAgICAgICAgLS1vdXRwdXQgdGV4dCkNCn0NCg0Kc2V0X2Vudmlyb25tZW50X3ZhcmlhYmxlcygpDQp7DQogICAgZWNobyAiZXhwb3J0IFJFRElTX0VORFBPSU5UPSR7cmVkaXNfZW5kcG9pbnR9Ig0KfQ0KDQoke2xvZ2dlcn0gInN0YXJ0ICQwIg0KDQpnZXRfaW5zdGFuY2VfaWQNCmdldF9yZWRpc19lbmRwb2ludA0KDQoke2xvZ2dlcn0gInNldCBlbnZpcm9ubWVudCINCnNldF9lbnZpcm9ubWVudF92YXJpYWJsZXMNCg0KJHtsb2dnZXJ9ICJpbnN0YWxsIGRvY2tlciBhbmQgZG9ja2VyLWNvbXBvc2UiDQp5dW0gLXkgaW5zdGFsbCBkb2NrZXINCnN5c3RlbWN0bCBzdGFydCBkb2NrZXINCnN5c3RlbWN0bCBlbmFibGUgZG9ja2VyDQpjdXJsIC1MICJodHRwczovL2dpdGh1Yi5jb20vZG9ja2VyL2NvbXBvc2UvcmVsZWFzZXMvZG93bmxvYWQvMS4yNC4wL2RvY2tlci1jb21wb3NlLSQodW5hbWUgLXMpLSQodW5hbWUgLW0pIiAtbyAvdXNyL2xvY2FsL2Jpbi9kb2NrZXItY29tcG9zZQ0KY2htb2QgK3ggL3Vzci9sb2NhbC9iaW4vZG9ja2VyLWNvbXBvc2UNCg0KJHtsb2dnZXJ9ICJpbnN0YWxsIGFwcCINCmNkIH4NCmdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vdGV0c2lzL3NpbXBsZS1jaGF0LmdpdA0KY2Qgc2ltcGxlLWNoYXQNCg0KJHtsb2dnZXJ9ICJydW4gYXBwIg0KZG9ja2VyLWNvbXBvc2UgdXAgLWQNCg0KJHtsb2dnZXJ9ICJmaW5pc2hlZCAkMCINCg0KZXhpdCAw
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
    user_data = <<EOF
    IyEvYmluL3NoDQoNCmF3cz0iL3Vzci9iaW4vYXdzIC0tcmVnaW9uIGFwLW5vcnRoZWFzdC0xIg0KbG9nZ2VyPSJsb2dnZXIgLXQgJDAiDQoNCmdldF9pbnN0YW5jZV9pZCgpDQp7DQogICAgaW5zdGFuY2VfaWQ9JChjdXJsIC1zIGh0dHA6Ly8xNjkuMjU0LjE2OS4yNTQvbGF0ZXN0L21ldGEtZGF0YS9pbnN0YW5jZS1pZCkNCn0NCg0KZ2V0X3JlZGlzX2VuZHBvaW50KCkNCnsNCiAgICByZWRpc19lbmRwb2ludD0kKCR7YXdzfSBlYzIgZGVzY3JpYmUtaW5zdGFuY2VzIFwNCiAgICAgICAgICAgICAgICAgIC0taW5zdGFuY2UtaWQgJHtpbnN0YW5jZV9pZH0gXA0KICAgICAgICAgICAgICAgICAgLS1xdWVyeSAnUmVzZXJ2YXRpb25zW10uSW5zdGFuY2VzW10uVGFnc1s/S2V5PT1gUmVkaXNfZW5kcG9pbnRgXS5WYWx1ZScgXA0KICAgICAgICAgICAgICAgICAgLS1vdXRwdXQgdGV4dCkNCn0NCg0Kc2V0X2Vudmlyb25tZW50X3ZhcmlhYmxlcygpDQp7DQogICAgZWNobyAiZXhwb3J0IFJFRElTX0VORFBPSU5UPSR7cmVkaXNfZW5kcG9pbnR9Ig0KfQ0KDQoke2xvZ2dlcn0gInN0YXJ0ICQwIg0KDQpnZXRfaW5zdGFuY2VfaWQNCmdldF9yZWRpc19lbmRwb2ludA0KDQoke2xvZ2dlcn0gInNldCBlbnZpcm9ubWVudCINCnNldF9lbnZpcm9ubWVudF92YXJpYWJsZXMNCg0KJHtsb2dnZXJ9ICJpbnN0YWxsIGRvY2tlciBhbmQgZG9ja2VyLWNvbXBvc2UiDQp5dW0gLXkgaW5zdGFsbCBkb2NrZXINCnN5c3RlbWN0bCBzdGFydCBkb2NrZXINCnN5c3RlbWN0bCBlbmFibGUgZG9ja2VyDQpjdXJsIC1MICJodHRwczovL2dpdGh1Yi5jb20vZG9ja2VyL2NvbXBvc2UvcmVsZWFzZXMvZG93bmxvYWQvMS4yNC4wL2RvY2tlci1jb21wb3NlLSQodW5hbWUgLXMpLSQodW5hbWUgLW0pIiAtbyAvdXNyL2xvY2FsL2Jpbi9kb2NrZXItY29tcG9zZQ0KY2htb2QgK3ggL3Vzci9sb2NhbC9iaW4vZG9ja2VyLWNvbXBvc2UNCg0KJHtsb2dnZXJ9ICJpbnN0YWxsIGFwcCINCmNkIH4NCmdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vdGV0c2lzL3NpbXBsZS1jaGF0LmdpdA0KY2Qgc2ltcGxlLWNoYXQNCg0KJHtsb2dnZXJ9ICJydW4gYXBwIg0KZG9ja2VyLWNvbXBvc2UgdXAgLWQNCg0KJHtsb2dnZXJ9ICJmaW5pc2hlZCAkMCINCg0KZXhpdCAw
EOF

    tags = {
        Name = "${var.app_name} instance 2",
        Redis_endpoint = "${aws_elasticache_replication_group.elasticache_main.primary_endpoint_address}"
    }
}
