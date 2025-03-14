provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_deployment" "myapp" {
  metadata {
    name = "myapp"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "myapp"
      }
    }
    template {
      metadata {
        labels = {
          app = "myapp"
        }
      }
      spec {
        container {
          image = "kabin2001/myapp:latest"
          name  = "myapp"
        }
      }
    }
  }
}
