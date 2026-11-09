module "security" {
  source = "../modules/security/"

  web_sg_name = var.web_sg_name
  db_sg_name  = var.db_sg_name
  vpc_main_id = module.network.vpc_main_id
}