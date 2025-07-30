variable "vpc_id" {
    description = "VPC ID from the VPC module"
    type        = string
}

variable "public_subnets_frontend" {
    description = "Frontend subnet"

}

variable "private_subnets_backend" {
    description = "Backend subnet"

}


variable "tf_tag" {
    type = bool
    default = true         
    description = "Terraform identifier"
  
}

variable "name_prefix" {
  description = "Prefix to use for naming resources"
  type        = string
}

variable "container_port" {
  type        = number
  description = "Port your app is listening on"
}

#variable "ecs_sg_id" {
 # type        = string
#  description = "Security group ID of ECS instances"
#}

variable "alb_sg_id" {
  type        = string
  description = "Security group ID of the ALB"
}
