resource "kubernetes_role_binding" "this" {
  for_each = var.bindings
  metadata {
    name      = "${var.namespace}-${each.key}-binding"
    namespace = var.namespace
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = each.key
  }
  dynamic "subject" {
    for_each = each.value
    content {
      kind      = split(":", subject.value)[0]
      name      = split(":", subject.value)[1]
      api_group = "rbac.authorization.k8s.io"
    }
  }
}
