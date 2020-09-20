resource "kubernetes_priority_class" "high_priority" {
  metadata {
    name = "high-priority"
  }

  value       = 1000000
  description = "This priority class should be used for nodejs pods only."
}