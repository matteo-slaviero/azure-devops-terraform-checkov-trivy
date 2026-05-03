variable "primary_location" {
  type        = string
  description = "Primary location of the resources"
  default     = "westeurope"
}

variable "demo_resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "demo_storage_account_name" {
  type        = string
  description = "Name of the test storage account"
}
