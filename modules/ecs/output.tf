output "ecs_cluster_id" {
  value = aws_ecs_cluster.this.id
}

output "ecs_service_name" {
  value = aws_ecs_service.app_service.name
}

output "ecs_asg_name" {
  value = aws_autoscaling_group.ecs_asg.name
}



