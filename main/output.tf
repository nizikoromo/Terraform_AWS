output "db_password" {
  value     = random_string.db_password.result
  sensitive = true
}