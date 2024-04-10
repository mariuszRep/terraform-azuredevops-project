// make sure you add this service pricipal as devops user and Project administrators
// add Project Collection Administrator: This role allows managing project collections.

provider "azuredevops" {
  org_service_url = "https://dev.azure.com/${var.org_name}"

  personal_access_token = var.pat

  client_id     = var.client_id
  tenant_id     = var.tenant_id
  client_secret = var.client_secret

}

resource "azuredevops_project" "this" {
  name               = var.project_name
  work_item_template = var.work_item_template
  version_control    = var.version_control
  visibility         = var.visibility
  description        = var.description
}

resource "azuredevops_serviceendpoint_azurerm" "this" {
  project_id                             = azuredevops_project.this.id
  service_endpoint_name                  = var.service_endpoint_name
  description                            = var.description
  service_endpoint_authentication_scheme = var.service_endpoint_authentication_scheme
  azurerm_spn_tenantid                   = var.tenant_id
  azurerm_subscription_id                = var.subscription_id
  azurerm_subscription_name              = var.subscription_name
}
