provider "helm" {
  kubernetes {
    host = var.kubernetes_host

    client_certificate     = var.k8s_client_certificate
    client_key             = var.k8s_client_key
    cluster_ca_certificate = var.k8s_cluster_ca_certificate
    load_config_file       = var.load_config_file
  }
}
