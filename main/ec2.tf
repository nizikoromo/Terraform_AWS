module "ec2" {
  source = "../modules/ec2/"

  key_name                 = var.key_name
  web_ami                  = var.web_ami
  ec2_name                 = var.ec2_name
  subnet_public_3a_id      = module.network.subnet_public_3a_id
  security_group_web_sg_id = module.security.security_group_web_sg_id
}