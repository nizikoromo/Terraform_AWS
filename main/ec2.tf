# key_pair
resource "aws_key_pair" "key_pair" {
  key_name   = "key_pair"
  public_key = data.aws_key_pair.key_pair.public_key
}

# instance
resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.redhat.id
  instance_type          = var.web_ami
  key_name               = aws_key_pair.key_pair.key_name
  subnet_id              = aws_subnet.public_3a.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "terraform_web_server"
  }
}