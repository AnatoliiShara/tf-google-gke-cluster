output "config_host" {
  description = "GKE Cluster Host"
  value       = data.google_container_cluster.main.endpoint
}

output "config_token" {
  description = "GKE Cluster Token"
  value       = data.google_client_config.current.access_token
  sensitive   = true    # ← Має бути ВСЕРЕДИНІ блоку output!
}

output "config_ca" {
  description = "GKE Cluster CA"
  value = base64decode(
    data.google_container_cluster.main.master_auth[0].cluster_ca_certificate,
  )
}

output "name" {
  description = "GKE Cluster Name"
  value       = google_container_cluster.this.name
}
