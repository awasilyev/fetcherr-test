module "rbac_binding" {
  source = "./modules/rbac_binding"
  providers = {
    kubernetes = kubernetes
  }
  namespaces = ["ns1", "ns2"]
  bindings = {
    "cluster-admin" = [
      "Group:test_sa_group@domain.com",
      "User:someone@domain.com",
      "ServiceAccount:service@google.com",
    ]
    "cluster-viewer" = [
      "Group:test_sa_group2@domain.com",
      "User:someone2@domain.com",
      "ServiceAccount:service2@google.com",
    ]
  }
}
