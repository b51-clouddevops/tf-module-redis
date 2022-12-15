# Creates Elastic Cache Cluster
resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "roboshop-redis-${var.ENV}"
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = ????
  engine_version       = "6.2"
  port                 = 6379
  subnet_group_name    = 
  security_group_ids   = 
}

# Creates Parameter Group from Elastic Cache Cluster
resource "aws_elasticache_parameter_group" "default" {
  name   = "roboshop-parameter-grp-${var.ENV}"
  family = "redis6.2"
}

# Creates Subnet Group
resource "aws_elasticache_subnet_group" "subnet-group" {
  name       = "redis-subnet-grp-${var.ENV}"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_ID

  tags = {
    Name = "redis-subnet-grp-${var.ENV}"
  }
}