# Console deployment
module twistlock_console {
  source                  = "./modules/console"
  namespace               = var.namespace
  storage_class_name      = var.storage_class_name
  twistclok_console_image = var.twistclok_console_image
  image_pull_secrets      = var.image_pull_secrets
  enable_bootstrap        = true
  console_username        = var.console_username
  console_password        = var.console_password
  twistclok_license_key   = var.twistclok_license_key
}

# Defender deployment
module "defender" {
  source = "./modules/defender"

  load_config_file           = false
  kubernetes_host            = data.ibm_container_cluster_config.cluster.host
  k8s_client_certificate     = data.ibm_container_cluster_config.cluster.admin_certificate
  k8s_client_key             = data.ibm_container_cluster_config.cluster.admin_key
  k8s_cluster_ca_certificate = data.ibm_container_cluster_config.cluster.ca_certificate

  console_hostname  = module.twistlock_console.console_ip
  console_username  = var.console_username
  console_password  = var.console_password
  namespace         = var.namespace
  helm_release_name = "defender-20.09.365"
  chart_name        = "defender_20_09_365.tgz"
}
