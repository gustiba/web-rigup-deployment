# CREATE NAMESPACES FPRO
resource "kubernetes_namespace" "fpro" {
  metadata {
    name = "fpro"
  }
}

# CREATE CLUSTER KUBERNETES
resource "google_container_cluster" "primary" {
  name     = "cluster-fpro"
  location = var.zones
  # remove_default_node_pool = true
  initial_node_count = 3    

  # master_auth {
  #   username = ""
  #   password = ""

  #   client_certificate_config {
  #     issue_client_certificate = false
  #   }
  # }

  node_config {
    preemptible  = true
    machine_type = var.machine_type

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }

    labels = {
      app = var.app_name
    }

    tags = ["app", var.app_name]
  }

    timeouts {
      create = "30m"
      update = "40m"
    }
}