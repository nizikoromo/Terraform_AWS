# RDS
resource "aws_db_subnet_group" "db_subnet" {
  name       = "db-subnet"
  subnet_ids = [aws_subnet.private_3a.id, aws_subnet.private_3c.id]

  tags = {
    Name = "terraform_db_subnet_group"
  }
}

resource "aws_db_parameter_group" "db_parameter" {
  name   = "db-parameter"
  family = "mysql8.4"
}

resource "random_string" "db_password" {
  length  = 16
  special = false
}

resource "aws_db_instance" "db" {
  identifier             = "mysql"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "mysql"
  engine_version         = "8.4"
  db_name                = "terraform_db"
  username               = "admin"
  password               = random_string.db_password.result
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [aws_security_group.db_sg.id]
  parameter_group_name   = aws_db_parameter_group.db_parameter.name
  skip_final_snapshot    = true

  tags = {
    Name = "terraform_db"
  }
}