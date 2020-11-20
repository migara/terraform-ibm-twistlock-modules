resource kubernetes_config_map this {
  metadata {
    name      = "twistlock-console"
    namespace = var.namespace
  }

  data = {
    "twistlock.cfg" = "${file("${path.module}/twistlock.cfg")}"
  }
}
