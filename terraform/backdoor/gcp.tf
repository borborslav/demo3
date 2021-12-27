##################
provider "google" {
  //credentials = file("../../../credentials/AppEngineMy.json") // PaaS Platform as a service
  credentials = file("../../../credentials/ComputeEngineMy.json") // IaaS Infrastructure as a service 
  project     = "teak-strength-332610"
  region      = "us-central1"
}
####################################
resource "google_compute_address" "extipmain2" {
  name = "extipmain2"
}
######################################
resource "google_compute_instance" "default10" {
  name         = "mainmachine"
  machine_type = "e2-standard-4"
  zone         = "us-central1-a"
  metadata_startup_script = templatefile("${path.module}/setup.sh",
    {
  })
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.extipmain2.address
    }
  }
  metadata = {
    foo = "bar"
  }
}
output "mainmachine_ip" {

  value       = google_compute_instance.default10.network_interface.0.network_ip
  description = "The IP address of mainmachine."
  //  sensitive   = true
}
