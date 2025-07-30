variable "name_prefix" {
  description = "Prefix for naming ALB resources"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where ALB will be deployed"
  type        = string
}

variable "public_subnets_ids" {
  description = "List of public subnet IDs for ALB"
  type        = list(string)
}

variable "container_port" {
  description = "Port exposed by the container"
  type        = number
}

variable "container_name" {
  description = "Name of the container (matches ECS task definition)"
  type        = string
}

variable "desired_count" {
  description = "Number of ECS tasks to run"
  type        = number
}
