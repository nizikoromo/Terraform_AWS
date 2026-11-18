# RDS
output "rds_endpoint" {
  description = "RDS MySQL instance endpoint"
  value       = module.rds.rds_endpoint
}

output "db_password" {
  description = "Random generated password for RDS database"
  value       = module.rds.db_password
  sensitive   = true
}

# EC2
output "ec2_public_ip" {
  description = "Public IP address of the Web/AP server"
  value       = module.ec2.public_ip
}