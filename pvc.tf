resource "kubernetes_persistent_volume_claim" "example_data_pvc" {
  metadata {
    name = "example-data-pvc"

    labels = {
      app = "example"
    }
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "500Mi"
      }
    }

    storage_class_name = "nfs"
  }
}