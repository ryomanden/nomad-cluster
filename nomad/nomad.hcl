# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Full configuration options can be found at https://www.nomadproject.io/docs/configuration

# --------------------------------------------------------------
# File: /etc/nomad.d/nomad.hcl
# Version: v1.0
# Description: This is the configuration file for Nomad. It enables both server and client functionalities.
#              Please specify the IP addresses of all nodes you want to join the cluster in { YOUR_NOMAD_NODE_IP }.
# --------------------------------------------------------------

datacenter = "ryo-dc1"
data_dir  = "/opt/nomad/data"
bind_addr = "0.0.0.0"

server {
  # license_path is required for Nomad Enterprise as of Nomad v1.1.1+
  # license_path = "/etc/nomad.d/license.hclic"
  enabled          = true
  bootstrap_expect = 3
  server_join {
    retry_join = [ { YOUR_NOMAD_NODE_IP }, { YOUR_NOMAD_NODE_IP }, { ... } ]
  }
}

client {
  enabled = true
  node_class = "compute"
  servers = [ { YOUR_NOMAD_NODE_IP }, { YOUR_NOMAD_NODE_IP }, { ... } ]
}

plugin "docker" {
  config {
    # Allow privileged mode containers
    allow_privileged = true
  }
}

consul {
  address = "127.0.0.1:8500"
}
