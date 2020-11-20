data ibm_resource_group resource_group {
  name = var.resource_group
}

data ibm_container_cluster_config cluster {
  cluster_name_id   = var.cluster_name
  resource_group_id = data.ibm_resource_group.resource_group.id
  admin             = true
}

provider kubernetes {
  load_config_file       = false
  host                   = data.ibm_container_cluster_config.cluster.host
  client_certificate     = data.ibm_container_cluster_config.cluster.admin_certificate
  client_key             = data.ibm_container_cluster_config.cluster.admin_key
  cluster_ca_certificate = data.ibm_container_cluster_config.cluster.ca_certificate
}

# Create twistlock namespace
resource kubernetes_namespace this {
  metadata {
    name = var.namespace
  }
}

data kubernetes_secret this {
  metadata {
    name = "all-icr-io"
  }
}

# Create imagePullSecrets within newly created namespace
resource "kubernetes_secret" "example" {
  metadata {
    name      = "all-icr-io"
    namespace = var.namespace
  }
  data = data.kubernetes_secret.this.data
  type = "kubernetes.io/dockerconfigjson"
}
