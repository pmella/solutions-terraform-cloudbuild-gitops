output "cluster_name" {
  value = "${google_container_cluster.default.name}"
}

output "subnet" {
  value = "${element(module.vpc.subnets_names, 0)}"
}