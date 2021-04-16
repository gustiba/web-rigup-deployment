output "name" {
  value = google_container_cluster.primary.name
}

output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "node_pools" {
  value = [google_container_cluster.primary.node_pool]
}

output "instance_group_urls" {
  value = [google_container_cluster.primary.instance_group_urls]
}

output "ip_jenkins" {
  value = google_compute_instance.jenkins-server.network_interface.0.access_config.0.nat_ip
}