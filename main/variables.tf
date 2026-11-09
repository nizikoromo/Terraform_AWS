variable "region" {
  type    = string
  default = "ap-northeast-3"
}

# network module
## vpc
variable "vpc_cidr_block" {
  type = string
}

variable "vpc_name" {
  type    = string
  default = "terraform_vpc"
}

## subnet
variable "public_3a_cidr_block" {
  type = string
}

variable "private_3a_cidr_block" {
  type = string
}

variable "private_3c_cidr_block" {
  type = string
}

variable "availability_zone_3a" {
  type    = string
  default = "ap-northeast-3a"
}

variable "availability_zone_3c" {
  type    = string
  default = "ap-northeast-3c"
}

variable "public_3a_name" {
  type    = string
  default = "terraform_public_3a"
}

variable "private_3a_name" {
  type    = string
  default = "terraform_private_3a"
}

variable "private_3c_name" {
  type    = string
  default = "terraform_private_3c"
}

## gateway
variable "igw_name" {
  type    = string
  default = "terraform_igw"
}

## routing
variable "rt_public_name" {
  type    = string
  default = "terraform_rt_public"
}

# security module
## security_group
variable "web_sg_name" {
  type    = string
  default = "terraform_web_sg"
}

variable "db_sg_name" {
  type    = string
  default = "terraform_db_sg"
}

# ec2 module
variable "web_ami" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type    = string
  default = "key_pair"
}

variable "ec2_name" {
  type    = string
  default = "terraform_web_server"
}

# rds module
variable "db_subnet_name" {
  type    = string
  default = "terraform_db_subnet_group"
}

variable "db_parameter_name" {
  type    = string
  default = "db-parameter"
}

variable "db_parameter_family" {
  type    = string
  default = "mysql8.4"
}

variable "db_identifier" {
  type = string
  default = "mysql"
}

variable "db_instance_class" {
  type = string
  default = "db.t3.micro"
}

variable "db_allocated_storage" {
  type = number
  default = 5
}

variable "db_engine" {
  type = string
  default = "mysql"
}

variable "engine_version" {
  type = string
  default = "8.4"
}

variable "db_username" {
  type = string
  default = "admin"
}

variable "db_name" {
  type    = string
  default = "terraform_db"
}