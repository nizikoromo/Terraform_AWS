output "vpc_main_id" {
    value = aws_vpc.main.id
}

output "subnet_public_3a_id" {
    value = aws_subnet.public_3a.id
}

output "subnet_private_3a_id" {
    value = aws_subnet.private_3a.id
}

output "subnet_private_3c_id" {
    value = aws_subnet.private_3c.id
}