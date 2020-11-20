resource kubernetes_service this {

  metadata {
    name = "twistlock-console"
    labels = {
      name = "console"
    }
    namespace = var.namespace
  }

  spec {
    selector = {
      name = "twistlock-console"
    }

    port {
      port = 8084
      name = "communication-port"
    }

    port {
      port = 8083
      name = "management-port-https"
    }

    type = "LoadBalancer"
  }

}
