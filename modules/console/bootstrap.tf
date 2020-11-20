resource "null_resource" "bootstrap" {
  count = var.enable_bootstrap ? 1 : 0
  provisioner "local-exec" {
    command = "bash ${path.module}/console_setup.sh"
    environment = {
      HOSTNAME    = kubernetes_service.this.load_balancer_ingress[0].ip
      USERNAME    = var.console_username
      PASSWORD    = var.console_password
      LICENSE_KEY = var.twistclok_license_key
    }
  }

  depends_on = [kubernetes_deployment.this]
}
