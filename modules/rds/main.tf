# RDS
resource "aws_db_subnet_group" "db_subnet" {
  name       = var.db_subnet_name
  subnet_ids = [var.subnet_private_3a_id, var.subnet_private_3c_id]

  tags = {
    Name = var.db_subnet_name
  }
}

resource "aws_db_parameter_group" "db_parameter" {
  name   = var.db_parameter_name
  family = var.db_parameter_family
}

resource "random_string" "db_password" {
  length  = 16
  special = false
}

resource "aws_db_instance" "db" {
  identifier             = var.db_identifier
  instance_class         = var.db_instance_class
  allocated_storage      = var.db_allocated_storage
  engine                 = var.db_engine
  engine_version         = var.engine_version
  db_name                = var.db_name
  username               = var.db_username
  password               = random_string.db_password.result
  db_subnet_group_name   = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids = [var.security_group_db_sg_id]
  parameter_group_name   = aws_db_parameter_group.db_parameter.name
  skip_final_snapshot    = true

  tags = {
    Name = var.db_name
  }
}