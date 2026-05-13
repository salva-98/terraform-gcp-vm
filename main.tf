provider "google" {
  project = "chrome-sublime-331617"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "hermes_vm_instance_main" {
  name         = "hermes-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size = 30
      type = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}

resource "google_compute_instance" "hermes_vm_instance" {
  name         = "hermes-personal-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size = 30
      type = "pd-standard"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}
