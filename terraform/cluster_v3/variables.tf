variable "gcp__credentials" {
    type = string
    description = "Location of service account for GSP"
}

variable "gcp_project_id" {
    type = string
    description = "GSP Project id"
}

variable "gcp_region" {
    type = string
    description = "GSP Region"
}

variable "gke_cluster_name" {
    type = string
    description = "GSP Cluster name"
}

variable "gke_zones" {
    type = list(string)
    description = "List of zones for the GKE Cluster"
}

variable "gke_network" {
    type = string
    description = "VPC Network name"
}

variable "gke_subnetwork" {
    type = string
    description = "VPC Sub Network name"
}

variable "gke_default_nodepool_name" {
    type = string
    description = "GKE Default node pool name"
}

variable "gke_service_account_name" {
    type = string
    description = "GKE Service Account name"
}

