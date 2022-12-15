# Creates Elastic Cache Cluster
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "roboshop-redis-${var.ENV}"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = ????
  port                 = 11211
}

# Creates Parameter Group from E