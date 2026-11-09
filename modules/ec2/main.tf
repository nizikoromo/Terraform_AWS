# key_pair
resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = data.aws_key_pair.key_pair.public_key
}

# instance
resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.redhat.id
  instance_type          = var.web_ami
  key_name               = aws_key_pair.key_pair.key_name
  subnet_id              = var.subnet_public_3a_id
  vpc_security_group_ids = [var.security_group_web_sg_id]

  tags = {
    Name = var.ec2_name
  }
}