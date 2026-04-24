provider "google" {
  project = "chrome-sublime-331617"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "hermes-personal-vm"
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size = 10
      type = "pd-standard"
    }
  }

  network_interface {
    network = "default"
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}
