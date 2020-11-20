resource kubernetes_persistent_volume_claim this {
  metadata {
    name      = "twistlock-console"
    namespace = var.namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "100Gi"
      }
    }
    storage_class_name = var.storage_class_name
  }
}
