# Increase log verbosity
log_level = "DEBUG"

# Setup data dir
data_dir = "/tmp/nomad-dev-cluster/client2"

# Give the agent a unique name. Defaults to hostname
name = "client2"

# Enable debugging
enable_debug = true

# Enable the client
client {
  enabled = true
  host_volume "my-website-db" {
        path = "/opt/volumes/my-website-db"
        read_only = false
    }
  server_join {
    retry_join = ["127.0.0.1:4647", "127.0.0.1:5647", "127.0.0.1:6647"]
  }

  meta {
    tag = "foo"
  }
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

ports {
  http = 8646
}
