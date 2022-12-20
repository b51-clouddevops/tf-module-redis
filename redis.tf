# Creates Elastic Cache Cluster
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "roboshop-redis-${var.ENV}"
  engine               = "redis"
  node_type            = var.DOCDB_PORT_INSTANCE_CLASS
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.pg.name
  engine_version       = var.DOCDB_ENGINE_VERSION
  port                 = var.REDIS_PORT
  subnet_group_name    = aws_elasticache_subnet_group.subnet-group.name
  security_group_ids   = [aws_security_group.allows_redis.id]
}

# Creates Parameter Group from Elastic Cache Cluster
resource "aws_elasticache_parameter_group" "pg" {
  name   = "roboshop-parameter-grp-${var.ENV}"
  family = "redis6.x"
}

# Creates Subnet Group
resource "aws_elasticache_subnet_group" "subnet-group" {
  name       = "redis-subnet-grp-${var.ENV}"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_ID

  tags = {
    Name = "redis-subnet-grp-${var.ENV}"
  }
}