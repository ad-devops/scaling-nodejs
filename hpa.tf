resource "kubernetes_horizontal_pod_autoscaler" "nodejs_scaling" {
  metadata {
    name = "nodejs-scaling"
  }

  spec {
    scale_target_ref {
      kind        = "Deployment"
      name        = "example-deployment"
      api_version = "apps/v1"
    }

    min_replicas = 10
    max_replicas = 20

    metric {
      type = "Resource"

      resource {
        name = "cpu"

        target {
          type                = "Utilization"
          average_utilization = 50
        }
      }
    }

    metric {
      type = "Resource"

      resource {
        name = "memory"

        target {
          type                = "Utilization"
          average_utilization = 60
        }
      }
    }
  }
}