variable "region" {
  type    = string
  default = "ap-northeast-3"
}

variable "vpc_cidr_block" {
  type = string
}

variable "public_3a_cidr_block" {
  type = string
}

variable "private_3a_cidr_block" {
  type = string
}

variable "availability_zone_3a" {
  type = string
}

variable "web_ami" {
  type    = string
  default = "t3.micro"
}