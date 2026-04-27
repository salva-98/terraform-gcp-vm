provider "google" {
  project = "chrome-sublime-331617"
  region  = "us-central1"
  zone    = "us-central1-a"
}

resource "google_compute_instance" "vm_instance" {
  name         = "test-vm"
  machine_type = "e2-micro"
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
    access_config {
      nat_ip       = "34.134.181.229"
      network_tier = "PREMIUM"
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }

  tags = ["http-server"]
  
}

resource "google_compute_instance" "hermes_vm_instance" {
  name         = "hermes-personal-vm"
  machine_type = "e2-medium"
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
    access_config {
    }
  }

  metadata = {
    enable-oslogin = "TRUE"
  }
}
