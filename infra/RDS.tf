resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "dbfinance"
  engine               = "mariadb"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "12345678"
  skip_final_snapshot  = true
  publicly_accessible  = false
  db_subnet_group_name = module.vpc.database_subnet_group_name
  vpc_security_group_ids = [aws_security_group.db.id]

  provisioner "local-exec" {
    command = "mysql -h ${self.address} -u ${self.username} -p'${self.password}' < ./script.sql"
  }
}

output "IP" {
  value = aws_db_instance.default.address
}
