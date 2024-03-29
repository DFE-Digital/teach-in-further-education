terraform {
  required_version = "~> 1.1.0"
  required_providers {
    cloudfoundry = {
      source  = "cloudfoundry-community/cloudfoundry"
      version = "0.14.2"
    }
  }
  backend "s3" {
    bucket = "paas-s3-broker-prod-lon-4ef2dde4-92d9-401b-a3a3-b3efb0cdf959"
    key    = "terraform"
    region = "eu-west-2"
  }
}

provider "cloudfoundry" {
  api_url      = local.paas_api_url
  user         = var.paas_user != "" ? var.paas_user : null
  password     = var.paas_password  != "" ? var.paas_password  : null
  sso_passcode = null
}