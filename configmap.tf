resource "kubernetes_config_map" "example_configmap" {
  metadata {
    name = "example-configmap"

    labels = {
      app = "example"
    }
  }
  data = {
    api_host             = "myhost:443"
    db_host              = "dbhost:5432"
  }
}