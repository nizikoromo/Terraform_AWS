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
  route_table_id = aws_route_table.rt_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "test" {
  subnet_id = aws_subnet.public_3a.id
  route_table_id = aws_route_table.rt_public.id
}