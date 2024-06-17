resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "root"
  engine               = "mariadb"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "1234"
  skip_final_snapshot  = true
  publicly_accessible  = false
  db_subnet_group_name = module.vpc.database_subnet_group_name
  vpc_security_group_ids = [aws_security_group.db.id]
}

output "IP" {
  value = aws_db_instance.default.address
}
