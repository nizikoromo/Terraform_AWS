output "db_password" {
  value     = random_string.db_password.result
  sensitive = true
}

output "rds_endpoint" {
  value = aws_db_instance.db.address
}