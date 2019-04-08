provider "kafka" {
  bootstrap_servers = ["localhost:9092"]
  sasl_username = "admin"
  sasl_password = "admin-secret"
}

resource "kafka_topic" "logs" {
  name               = "systemd_logs"
  replication_factor = 1
  partitions         = 100

  config = {
    "segment.ms"     = "20000"
    "cleanup.policy" = "compact"
  }
}

resource "kafka_topic" "foo" {
  name               = "jamie"
  replication_factor = 1
  partitions         = 100
}

resource "kafka_acl" "test" {
  resource_name       = "syslog"
  resource_type       = "Topic"
  acl_principal       = "User:Alice"
  acl_host            = "*"
  acl_operation       = "Write"
  acl_permission_type = "Allow"
}
