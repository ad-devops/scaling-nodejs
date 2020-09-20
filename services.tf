resource "kubernetes_service" "example_svc" {
  metadata {
    name = "example-svc"
  }

  spec {
    port {
      name        = "http"
      port        = 3000
      target_port = "http"
    }

    selector = {
      app = "example"
    }

    type = "LoadBalancer"
  }
}