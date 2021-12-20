##################
provider "google" {
  credentials = file("credentials.json")
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




resource "google_sql_database_instance" "test1" {
  name             = "test1"
  database_version = "POSTGRES_11"
  region           = "us-central1"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-n1-standard-4"
  }
}


resource "google_sql_user" "postgres" {
  project  = "test-project"
  name     = "postgres"
  instance = google_sql_database_instance.test1.name
  password = "xxxxxxxx"
}

resource "postgresql_database" "test_db" {
  name = "test_db"
}
