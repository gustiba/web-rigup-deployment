# #variables for provider
# variable "credentials" {
#   default = "test-cicd-credential.json"
# }

variable "credentials" {
  default = "test-cicd-306003-2.json"
}

variable "project" {
  default = "test-cicd-306003"
}

variable "zones" {
  default = "asia-east1-a"
}

#variables for main.tf
variable "namespace" {
  default = "fpro"
}

variable "image_instance" {
  default = "debian-cloud/debian-9"
}

variable "region" {
  default = "asia-east1"
}

variable "machine_type" {
  default = "e2-micro"
}

variable "machine_type_jenkins" {
  default = "e2-standard-2"
}

variable "app_name" {
  default = "rigupapp"
}

variable "type_frontend" {
  default = "frontend"
}

variable "type_backend" {
  default = "backend"
}

variable "type_adminer" {
  default = "adminer"
}

variable "type_db" {
  default = "db"
}

#variables for deployment pod
variable "db_user" {
  default = "root"
}

variable "db_password" {
  default = "qwe123"
}

variable "db_name" {
  default = "db_fpro"
}

