job "plugin-smb-nodes" {
  datacenters = ["ryo-dc1"]
  type        = "system"
  namespace   = "platform"

 
  group "nodes" {
    
    task "plugin" {
      driver = "docker"

      config {
        image = "mcr.microsoft.com/k8s/csi/smb-csi:v1.7.0"
        args = [
          "--v=5",
          "--nodeid=${attr.unique.hostname}",
          "--endpoint=unix:///csi/csi.sock",
          "--drivername=smb.csi.k8s.io"
        ]
        # node plugins must run as privileged jobs because they
        # mount disks to the host
        privileged = true
      }

      csi_plugin {
        id        = "smb"
        type      = "node"
        mount_dir = "/csi"
      }

      resources {
        memory = 512
        cpu    = 512
      }
    }
  }
}