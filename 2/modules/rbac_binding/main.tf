locals {
  bindings = { for pair in setproduct(var.namespaces, keys(var.bindings)) : "${pair[0]}-${pair[1]}" => {
    ns   = pair[0]
    role = pair[1]
  } }
}

resource "kubernetes_role_binding" "this" {
  for_each = local.bindings
  metadata {
    name      = "${each.key}-binding"
    namespace = each.value["ns"]
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = each.value.role
  }
  dynamic "subject" {
    for_each = toset(var.bindings[each.value.role])
    content {
      kind      = split(":", subject.key)[0]
      name      = split(":", subject.key)[1]
      api_group = "rbac.authorization.k8s.io"
    }
  }
}
