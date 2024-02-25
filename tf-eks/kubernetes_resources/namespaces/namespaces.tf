resource "kubernetes_namespace_v1" "namespace" {
  for_each = toset( var.names )
  metadata {
    name = each.key
  }
}
