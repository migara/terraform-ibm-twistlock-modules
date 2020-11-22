variable kubernetes_host {
  type        = string
  description = "The hostname (in form of URI) of Kubernetes master. Can be sourced from KUBE_HOST"
}

variable k8s_client_certificate {
  type        = string
  description = "PEM-encoded client certificate for TLS authentication. Can be sourced from KUBE_CLIENT_CERT_DATA."
}

variable k8s_client_key {
  type        = string
  description = "PEM-encoded client certificate key for TLS authentication. Can be sourced from KUBE_CLIENT_KEY_DATA."
}

variable k8s_cluster_ca_certificate {
  type        = string
  description = "PEM-encoded root certificates bundle for TLS authentication. Can be sourced from KUBE_CLUSTER_CA_CERT_DATA."
}

variable load_config_file {
  type        = bool
  description = "By default the local config (~/.kube/config) is loaded when you use this provider. This option at false disable this behaviour. Can be sourced from KUBE_LOAD_CONFIG_FILE."
  default     = false
}

variable namespace {
  type        = string
  description = "The target deamonset namespaces"
}

variable console_hostname {
  type        = string
  description = "The console address for defender communication"
}

variable console_username {
  type        = string
  description = "Console username"
}

variable console_password {
  type        = string
  description = "Console password"
}

variable helm_release_name {
  type        = string
  description = "Helm release name"
}

variable chart_name {
  type        = string
  description = "Helm chart name"
}
