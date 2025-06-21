variable "name_prefix" {}
variable "ecs_cluster_name" {}
variable "instance_type" {}
variable "private_subnet_ids" {}   # type = list(string)
variable "ecs_sg_id" {}
variable "desired_capacity" {}
variable "max_size" {}
variable "min_size" {}

# ECS Task Definition
variable "task_family" {}
variable "container_name" {}
variable "container_image" {}
variable "container_port" {}
variable "cpu" {}
variable "memory" {}
variable "desired_count" {}
