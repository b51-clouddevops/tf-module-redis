# Creates Elastic Cache Cluster
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "roboshop-redis-${var.ENV}"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = ????
  engine_version       = "6.2"
  port                 = 6379
}

# Creates Parameter Group from Elastic Cache Cluster
