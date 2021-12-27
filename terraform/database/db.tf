##################
provider "google" {
  //credentials = file("../../../credentials/AppEngineMy.json") // PaaS Platform as a service
  credentials = file("../../../credentials/ComputeEngineMy.json") // IaaS Infrastructure as a service
  project     = "teak-strength-332610"
  region      = "us-central1"
}
####################################
terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.14.0"
    }
  }
}

resource "google_sql_database_instance" "test5" {
  name             = "test5"
  database_version = "POSTGRES_11"
  region           = "us-central1"
  settings {
    //tier = "db-n1-standard-4"
    tier = "db-f1-micro"
  }
  deletion_protection = "false"
}

/*
resource "google_sql_user" "postgres" {
  project  = "test-project"
  name     = "postgres"
  instance = google_sql_database_instance.test1.name
  password = "xxxxxxxx" // for test delete before push to git
}
*/

/*
resource "postgresql_database" "test_db3" {
  name = "test_db3"
}
*/
