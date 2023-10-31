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