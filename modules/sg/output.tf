output "ecs_sg_id" {
  value = aws_security_group.ecs.id
}

output "mysql_sg_id" {
  value = aws_security_group.mysql.id
}