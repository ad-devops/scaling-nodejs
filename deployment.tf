resource "kubernetes_deployment" "example_deployment" {
  metadata {
    name = "example-deployment"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "example"
      }
    }

    template {
      metadata {
        labels = {
          app = "example"
        }
      }

      spec {
        volume {
          name = "example-config"

          config_map {
            name = "example-configmap"
          }
        }

        volume {
          name = "example-data"

          persistent_volume_claim {
            claim_name = "example-data-pvc"
          }
        }

        container {
          name  = "example"
          image = "bitnami/node-example:0.0.1"

          port {
            name           = "http"
            container_port = 3000
          }

          resources {
            requests {
              cpu    = "100m"
              memory = "200Mi"
            }
          }

          volume_mount {
            name       = "example-config"
            mount_path = "/app/config.js"
            sub_path   = "config.js"
          }

          volume_mount {
            name       = "example-data"
            mount_path = "/app/data"
          }

          liveness_probe {
            http_get {
              path = "/"
              port = "http"

              http_header {
                name  = "Host"
                value = "app.example.com"
              }
            }

            initial_delay_seconds = 15
          }

          readiness_probe {
            http_get {
              path = "/"
              port = "http"

              http_header {
                name  = "Host"
                value = "app.example.com"
              }
            }

            initial_delay_seconds = 5
          }
        }

        restart_policy = "Always"

        image_pull_secrets {
          name = "us-east-2-ecr-registry"
        }

        priority_class_name = "high-priority"
      }
    }
  }
}