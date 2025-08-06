provider "google"{
#  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}

resource "google_compute_firewall" "k3s-firewall" {
  name    = "k3s-firewall"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["6443","22"]
  }

  target_tags = ["k3s"]
  source_ranges = ["0.0.0.0/0"]
  source_tags = ["k3s"]
}

resource "google_compute_instance" "k3s-master" {
  name         = "k3s-master"
  machine_type = "n2-standard-2"
  zone         = var.zone
  tags         = ["k3s", "k3s-master", "http-server", "https-server"]


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"


    access_config {
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }

  depends_on = [
    google_compute_firewall.k3s-firewall,
  ]

}

output "external_ip" {
  description = "The external NAT IP address of the instance."
  value       = google_compute_instance.k3s-master.network_interface[0].access_config[0].nat_ip
}
