resource "aws_db_subnet_group" "database_subnet_group" {
  name       = "mydb-subnet-group"
  description = "My DB subnet group"
  subnet_ids = [var.private_subnets_database["private_subnet_database_1"].id,  var.private_subnets_database["private_subnet_database_2"].id ]
}

resource "aws_db_instance" "db_1" {
  allocated_storage    = 10
  db_name              = "mydb_1"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admin@1234"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  db_subnet_group_name = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids = [var.private_subnets_database_sg]
  availability_zone      = var.subnets_az[0]  


}


resource "aws_db_instance" "db_2" {
  allocated_storage    = 10
  db_name              = "mydb_2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admin@1234"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  db_subnet_group_name = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids = [var.private_subnets_database_sg]
  availability_zone      = var.subnets_az[1] 


}



