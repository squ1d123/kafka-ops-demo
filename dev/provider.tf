provider "kafka" {
  bootstrap_servers = ["localhost:9092"]
  sasl_username     = "admin"
  sasl_password     = "admin-secret"
}
