output "backend_sg_id" {
  value = aws_security_group.allow_backend.id
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}


output "ecs_sg_id" {
  value = aws_security_group.ecs_instance_sg.id
}



output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}