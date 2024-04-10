terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
  }
}

locals {
  org_name     = "devops-org-name"
  
  client_id     = ""
  tenant_id     = ""
  client_secret = ""

  project_name = "project"

}

provider "azuredevops" {
  org_service_url = "https://dev.azure.com/${local.org_name}"

  client_id     = local.client_id
  tenant_id     = local.tenant_id
  client_secret = local.client_secret

}

module "azuredevops_project" {
  source = "../modules/azuredevops_project"

  org_name      = local.org_name

  client_id     = local.client_id
  tenant_id     = local.tenant_id
  client_secret = local.client_secret

  project_name       = local.project_name
  work_item_template = "Agile"
  version_control    = "Git"
  visibility         = "private"
  description        = "Managed by Terraform"

  service_endpoint_name                  = "test"
  service_endpoint_description           = "Managed by Terraform"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  subscription_id                        = local.subscription_id
  subscription_name                      = data.azurerm_subscription.current.display_name

}







