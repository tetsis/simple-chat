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

    tags = {
        Name = "${var.app_name} instance 1",
        RDS_endpoint = "${aws_elasticache_replication_group.elasticache_main.primary_endpoint_address}"
    }
}

resource "aws_instance" "app_main2" {
    ami           = var.ami
    associate_public_ip_address = "true"
    instance_type = "t2.micro"
    key_name      = "${var.my_public_key}"
    subnet_id     = "${aws_subnet.vpc_main-public-subnet2.id}"
    vpc_security_group_ids = ["${aws_security_group.app_sg.id}"]

    tags = {
        Name = "${var.app_name} instance 2",
        RDS_endpoint = "${aws_elasticache_replication_group.elasticache_main.primary_endpoint_address}"
    }
}
