output "alb_dns_name" {
  value = aws_lb.ecs_alb.dns_name
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "target_group_arn" {
  value = aws_lb_target_group.ecs_tg.arn
}

output "ecs_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "listener_arn" {
  value = aws_lb_listener.ecs_listener.arn
}


