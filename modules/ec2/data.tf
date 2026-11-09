# key pair
data "aws_key_pair" "key_pair" {
  key_name           = "terraform_aws"
  include_public_key = true

  filter {
    name   = "tag:terraform"
    values = ["ec2"]
  }
}

# ami filter
data "aws_ami" "redhat" {
  most_recent = true
  owners      = ["309956199498"] # Red Hat公式のAWSアカウントID

  filter {
    name   = "name"
    values = ["RHEL-9*-x86_64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}