output "alb_dns_name" {
  value = aws_lb.ecs_alb.dns_name
}



output "target_group_arn" {
  value = aws_lb_target_group.ecs_tg.arn
}



output "listener_arn" {
  value = aws_lb_listener.ecs_listener.arn
}


