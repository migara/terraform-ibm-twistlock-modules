variable resource_group {
  description = "Name of resource group to provision resources"
  default     = "Default"
}

variable cluster_name {
  type        = string
  description = "Name of the IKS cluster"
}

variable namespace {
  type        = string
  description = "Twistlock namespace"
  default     = "twistlock"
}

variable storage_class_name {
  type        = string
  description = <<-EOF
  (Optional) Name of the storage class requested by the claim
  Optionally set the storage class to premium storage class (ibmc-file-retain-silver) for IKS deployments
  EOF
  default     = "ibmc-file-retain-silver"
}

variable twistclok_console_image {
  type        = string
  description = "Twistlock console docker image name"
}

variable image_pull_secrets {
  type        = list(string)
  description = "(optional) ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling any of the images"
  default     = ["all-icr-io"]
}

variable "console_username" {
  type        = string
  description = "Twistlock console username"
}

variable "console_password" {
  type        = string
  description = "Twistlock console password"
}

variable twistclok_license_key {
  type        = string
  description = "Twistlock license key"
}
