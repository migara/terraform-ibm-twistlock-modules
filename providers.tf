provider ibm {
  region           = "eu-gb"
  ibmcloud_timeout = 60
}

terraform {
  required_version = ">=0.12.29, <0.14"
  required_providers {
    ibm = {
      version = "~> 1.14"
    }
  }
}
