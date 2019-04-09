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
