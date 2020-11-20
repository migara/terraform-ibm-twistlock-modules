resource kubernetes_service_account this {
  metadata {
    name      = "twistlock-console"
    namespace = var.namespace
  }
}
