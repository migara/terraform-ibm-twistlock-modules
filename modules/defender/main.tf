resource "helm_release" "this" {
  name  = var.helm_release_name
  chart = "${path.root}/${var.chart_name}"

  depends_on = [null_resource.defender]
}

resource "null_resource" "defender" {
  provisioner "local-exec" {
    command = "bash ${path.module}/download_defender.sh"
    environment = {
      HOSTNAME   = var.console_hostname
      USERNAME   = var.console_username
      PASSWORD   = var.console_password
      NAMESPACE  = var.namespace
      CHART_NAME = var.chart_name
    }
  }
}
