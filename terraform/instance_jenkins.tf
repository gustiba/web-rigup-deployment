resource "google_compute_instance" "jenkins-server" {
  name         = "jenkins-server"
  machine_type = var.machine_type_jenkins
  zone         = var.zones

    tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = var.image_instance
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

    metadata_startup_script = "sudo apt-get update"
}