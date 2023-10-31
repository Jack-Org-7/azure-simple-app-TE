variable "region" {
  description = "Azure infrastructure region"
  type        = string
  default     = "eastus"
}

variable "app" {
  description = "Application that we want to deploy"
  type        = string
  default     = "mtnapp"
}

variable "project" {
  description = "The project name"
  default     = "mtn_project"
}

variable "backendport" {
  description = "The exposed container port... Mtn app is 5001"
  default     = 5001
}