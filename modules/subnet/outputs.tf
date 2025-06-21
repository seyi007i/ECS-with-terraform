output "public_subnets_frontend" {
  value = aws_subnet.public_subnets_frontend
}

output "private_subnets_backend" {
  value = aws_subnet.private_subnets_backend
}

output "private_subnets_database" {
  value = aws_subnet.private_subnets_database
}

output "private_subnet_ids" {
  value = [for key in sort(keys(aws_subnet.private_subnets_backend)) : aws_subnet.private_subnets_backend[key].id]
}
