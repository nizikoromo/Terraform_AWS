module "network" {
  source = "../modules/network/"

  # vpc
  vpc_cidr_block = var.vpc_cidr_block
  vpc_name       = var.vpc_name

  # subnet
  availability_zone_3a  = var.availability_zone_3a
  availability_zone_3c  = var.availability_zone_3c
  public_3a_cidr_block  = var.public_3a_cidr_block
  public_3a_name        = var.public_3a_name
  private_3a_cidr_block = var.private_3c_cidr_block
  private_3a_name       = var.private_3a_name
  private_3c_cidr_block = var.private_3c_cidr_block
  private_3c_name       = var.private_3c_name

  # gateway
  igw_name = var.igw_name

  # routing
  rt_public_name = var.rt_public_name
}