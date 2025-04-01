resource "helm_release" "cert-manager" {
  name             = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true

  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.17.1"

  upgrade_install = true

  set {
    name  = "installCRDs"
    value = "true"
  }
}
