variable "paas_exporter_username" {}

variable "paas_exporter_password" {}

variable "grafana_admin_password" {}

output "paas_username" {
  value = var.paas_exporter_username
}

locals {
  paas_api_url               = "https://api.london.cloud.service.gov.uk"
}