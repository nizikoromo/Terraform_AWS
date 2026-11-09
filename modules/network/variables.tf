# vpc
variable "vpc_cidr_block" {}
variable "vpc_name" {}

# subnet
variable "public_3a_cidr_block" {}
variable "private_3a_cidr_block" {}
variable "private_3c_cidr_block" {}
variable "availability_zone_3a" {}
variable "availability_zone_3c" {}
variable "public_3a_name" {}
variable "private_3a_name" {}
variable "private_3c_name" {}

# gateway
variable "igw_name" {}

# routing
variable "rt_public_name" {}