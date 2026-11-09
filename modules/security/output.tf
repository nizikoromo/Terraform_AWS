
output "security_group_web_sg_id" {
    value = aws_security_group.web_sg.id
}

output "security_group_db_sg_id" {
    value = aws_security_group.db_sg.id
}