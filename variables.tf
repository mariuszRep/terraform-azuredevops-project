
#---------------------------#
# provider                  #
#---------------------------#
variable "org_name" {
  description = "Name of the Azure DevOps organization"
}

variable "pat" {
  description = "Personal Access Token for Azure DevOps"
  default     = null
}

variable "client_id" {
  description = "Client ID for Azure DevOps provider authentication"
  default     = null
}

variable "tenant_id" {
  description = "Tenant ID for Azure DevOps provider authentication"
  default     = null
}

variable "client_secret" {
  description = "Client Secret for Azure DevOps provider authentication"
  default     = null
}

#---------------------------#
# azuredevops_project block #
#---------------------------#
variable "project_name" {
  description = "(Required) The Project Name."
}

variable "work_item_template" {
  description = "(Optional) Specifies the work item template. Valid values: Agile, Basic, CMMI, Scrum or a custom, pre-existing one. Defaults to Agile. An empty string will use the parent organization default."
  default     = null
}

variable "version_control" {
  description = "(Optional) Specifies the version control system. Valid values: Git or Tfvc. Defaults to Git."
  default     = null
}

variable "visibility" {
  description = "(Optional) Specifies the visibility of the Project. Valid values: private or public. Defaults to private."
  default     = null
}

variable "description" {
  description = "(Optional) Description for the Azure DevOps project"
  default     = null
}


#-------------------------------------------#
# azuredevops_serviceendpoint_azurerm block #
#-------------------------------------------#

variable "service_endpoint_name" {
  description = "Name of the Azure DevOps service endpoint"
}

variable "service_endpoint_description" {
  description = "Description for the Azure DevOps service endpoint"
  default     = "Managed by Terraform"
}

variable "service_endpoint_authentication_scheme" {
  description = "Authentication scheme for the Azure DevOps service endpoint"
  default     = "WorkloadIdentityFederation"
}

variable "subscription_id" {
  description = "ID of the Azure subscription"
}

variable "subscription_name" {
  description = "Name of the Azure subscription"
}
