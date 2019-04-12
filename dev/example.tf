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

resource "kafka_topic" "my-new-topic-which-is-awesome" {
  name               = "my-new-topic-which-is-awesome"
  replication_factor = 1
  partitions         = 3

  config = {
    "retention.ms" = 48000
  }
}

resource "kafka_topic" "my-new-topic" {
  name               = "my-new-topic"
  replication_factor = 1
  partitions         = 3

  config = {
    "retention.ms" = 700
  }
}

resource "kafka_acl" "my-new-group" {
  resource_name       = "my-new-group"
  resource_type       = "Group"
  acl_principal       = "User:Alice"
  acl_host            = "*"
  acl_operation       = "Read"
  acl_permission_type = "Allow"
}
