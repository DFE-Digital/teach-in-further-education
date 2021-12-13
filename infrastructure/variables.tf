variable "paas_exporter_username" {}

variable "paas_exporter_password" {}

variable "grafana_admin_password" {}

variable "grafana_runtime_version" { default = "8.3.1" }

variable "paas_user" {}

variable "paas_password" {}

output "paas_username" {
  value = var.paas_user
}

locals {
  paas_api_url               = "https://api.london.cloud.service.gov.uk"
}