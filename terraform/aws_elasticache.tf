resource "aws_elasticache_replication_group" "elasticache_main" {
  automatic_failover_enabled    = false
  availability_zones            = [var.private_segment1_az]
  replication_group_id          = "elasticache"
  replication_group_description = "${var.app_name} replica group"
  node_type                     = "cache.t2.micro"
  number_cache_clusters         = 1
  parameter_group_name          = "default.redis5.0"
  port                          = 6379
  security_group_ids            = [aws_security_group.elasticache_sg.id]
  subnet_group_name             = aws_elasticache_subnet_group.elasticache_sg.name
}

resource "aws_elasticache_subnet_group" "elasticache_sg" {
  name       = "elasticache-subnet-group"
  subnet_ids = [aws_subnet.vpc_main-public-subnet1.id, aws_subnet.vpc_main-public-subnet2.id]
}

