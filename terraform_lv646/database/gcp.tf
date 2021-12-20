##################
provider "google" {
  credentials = file("credentials.json")
  project     = "gcp101233-lv61301devops"
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

provider "postgresql" {
  scheme   = "gcppostgres"
  #host     = "test-project/europe-west3/test-instance"
  username = "postgres"
  port     = 5432
  password = "test1234"

  superuser = false
}


resource "google_sql_database_instance" "lv646db1" {
  name             = "lv646db1"
  database_version = "POSTGRES_11"
  region           = "us-central1"

  settings {
    # Second-generation instance tiers are based on the machine
    # type. See argument reference below.
    tier = "db-f1-micro" #//  db-n1-standard-4   db-f1-micro
  }
}

resource postgresql_database "test_db" {
  name = "test_db"
}

// Get SSL certificate
resource "google_sql_ssl_cert" "client_cert" {
  common_name = "instance-master-client"
  instance    = google_sql_database_instance.instance-master.name
}



