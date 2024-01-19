job "csi-smb-controller" {
  datacenters = ["ryo-dc1"]
  namespace = "platform"

  
  group "controller" {
    count = 3
    
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