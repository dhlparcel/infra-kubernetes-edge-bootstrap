resource "helm_release" "nginx_ingress_controller" {
  name             = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.12.0"

  atomic          = true
  upgrade_install = true
  timeout         = 600

  set {
    name  = "controller.image.registry"
    value = "registry.k8s.io"
  }

  set {
    name  = "controller.image.image"
    value = "ingress-nginx/controller"
  }

  set {
    name  = "controller.image.tag"
    value = "v1.12.0"
  }

  set {
    name  = "controller.service.type"
    value = "ClusterIP"
  }
}
