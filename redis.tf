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
resource "aws_elasticache_parameter_group" "default" {
  name   = "roboshop-parameter-grp-${var.ENV}"
  family = "redis6.2"
}

# Creates Subnet Group
resource "aws_elasticache_subnet_group" "subnet-group" {
  name       = "roboshop-subnet-grp-${var.ENV}"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_ID

  tags = {
    Name = "robot-docdb-${var.ENV}"
  }
}