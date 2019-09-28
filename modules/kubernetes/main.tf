resource "google_container_cluster" "default" {
  name               = "mood-cluster"
  zone               = "${var.subnet.zone}"
  initial_node_count = 1
  network            = "${google_compute_subnetwork.default.name}"
  subnetwork         = "${var.subnet}"

  // Use legacy ABAC until these issues are resolved:
  //   https://github.com/mcuadros/terraform-provider-helm/issues/56
  //   https://github.com/terraform-providers/terraform-provider-kubernetes/pull/73
  enable_legacy_abac = true

  // Wait for the GCE LB controller to cleanup the resources.
  provisioner "local-exec" {
    when    = "destroy"
    command = "sleep 90"
  }
}
