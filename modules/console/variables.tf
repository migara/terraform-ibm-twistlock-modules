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
  default     = null
}

variable twistclok_console_image {
  type        = string
  description = "Twistlock console docker image name"
}

variable image_pull_secrets {
  type        = list(string)
  description = "(optional) ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling any of the images"
  default     = []
}

variable enable_bootstrap {
  type        = bool
  description = "(optional) setup initial user, license console and add console IP to SAN list"
  default     = false
}

variable console_username {
  type        = string
  description = "(optional) Required if enable_bootstrap is set to true and if initial user needs to be set"
}

variable console_password {
  type        = string
  description = "(optional) Required if enable_bootstrap is set to true and if initial user needs to be set"
}

variable twistclok_license_key {
  type        = string
  description = "(optional) Required if enable_bootstrap is set to true and if license needs to be set"
}


