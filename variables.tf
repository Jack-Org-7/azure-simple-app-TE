variable "region" {
  description = "Azure infrastructure region"
  type    = string
  default = "us-east"
}

variable "app" {
  description = "Application that we want to deploy"
  type    = string
  default = "mtnapp"
}