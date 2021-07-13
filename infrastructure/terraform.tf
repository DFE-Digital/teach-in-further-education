terraform {
  required_version = "~> 1.0.2"
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.14.2"
    }
  }
}

provider "cloudfoundry" {
  api_url      = local.paas_api_url
  user         = var.paas_exporter_username != "" ? var.paas_exporter_username : null
  password     = var.paas_exporter_password != "" ? var.paas_exporter_password : null
  sso_passcode = null
}