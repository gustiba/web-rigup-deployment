provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}