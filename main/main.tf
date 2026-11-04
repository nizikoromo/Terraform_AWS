# vpc
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "terraform_vpc"
  }
}

# subnet
resource "aws_subnet" "public_3a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_3a_cidr_block
  availability_zone       = var.availability_zone_3a
  map_public_ip_on_launch = true

  tags = {
    Name = "terraform_public_3a"
  }
}

resource "aws_subnet" "private_3a" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_3a_cidr_block
  availability_zone = var.availability_zone_3a

  tags = {
    Name = "terraform_private_3a"
  }
}

# gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform_igw"
  }
}

# routing
resource "aws_route_table" "rt_public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "terraform_rt_public"
  }
}

resource "aws_route" "public" {
  route_table_id         = aws_route_table.rt_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "test" {
  subnet_id      = aws_subnet.public_3a.id
  route_table_id = aws_route_table.rt_public.id
}

# security_group(Web/AP server)
resource "aws_security_group" "web_sg" {
  name        = "webServers_security_group"
  description = "Allow SSH and ICMP, HTTP/S inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "terraform_web_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.web_sg.id
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = "${chomp(data.http.my_ip.response_body)}/32"
}

resource "aws_vpc_security_group_ingress_rule" "icmp" {
  security_group_id = aws_security_group.web_sg.id
  ip_protocol       = "icmp"
  from_port         = 8
  to_port           = 8
  cidr_ipv4         = "${chomp(data.http.my_ip.response_body)}/32"
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.web_sg.id
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.web_sg.id
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "web_all" {
  security_group_id = aws_security_group.web_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}

# security_group(rds)
resource "aws_security_group" "db_sg" {
  name        = "db_security_group"
  description = "Allow web_sg inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "terraform_db_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "db" {
  security_group_id = aws_security_group.db_sg.id
  ip_protocol       = "tcp"
  from_port         = 3306
  to_port           = 3306
 referenced_security_group_id = aws_security_group.web_sg.id
}

resource "aws_vpc_security_group_egress_rule" "db_all" {
  security_group_id = aws_security_group.db_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}