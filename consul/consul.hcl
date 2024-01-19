# --------------------------------------------------------------
# File: /etc/consul.d/consul.hcl
# Version: v1.0
# Description: This is the configuration file for Consul.
#              Please specify the IP addresses of all nodes you want to join the cluster in { YOUR_NOMAD_NODE_IP },
#              and the NIC you want to use in { YOUR_NODE_NIC }.
#              For example, if you want to use eth0, please replace { YOUR_NODE_NIC } with eth0.
# --------------------------------------------------------------

datacenter       = "ryo-dc1"
server           = true
bootstrap_expect = 3
data_dir         = "/opt/consul"
ui               = true
advertise_addr   = "{{ GetInterfaceIP \"{ YOUR_NODE_NIC }\" }}"
bind_addr        = "0.0.0.0"
client_addr      = "0.0.0.0"
retry_join       = [ { YOUR_NOMAD_NODE_IP }, { YOUR_NOMAD_NODE_IP }, { ... } ]