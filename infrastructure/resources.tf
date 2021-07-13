
module prometheus_all {
  source = "git::https://github.com/DFE-Digital/cf-monitoring.git//prometheus_all"
  monitoring_instance_name = "teach-in-further-education"
  monitoring_org_name      = "dfe"
  monitoring_space_name    = "teach-in-further-education-service"
  paas_exporter_username   = var.paas_exporter_username
  paas_exporter_password   = var.paas_exporter_password
  grafana_admin_password   = var.grafana_admin_password
}