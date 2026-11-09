module "rds" {
  source = "../modules/rds/"

  db_subnet_name       = var.db_subnet_name
  subnet_private_3a_id = module.network.subnet_private_3a_id
  subnet_private_3c_id = module.network.subnet_private_3c_id

  db_parameter_name   = var.db_parameter_name
  db_parameter_family = var.db_parameter_family

  db_identifier = var.db_identifier
  db_instance_class = var.db_instance_class
  db_allocated_storage = var.db_allocated_storage
  db_engine = var.db_engine
  engine_version = var.engine_version
  db_name                 = var.db_name
  db_username = var.db_username
  security_group_db_sg_id = module.security.security_group_db_sg_id
}