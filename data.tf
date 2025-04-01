data "kubernetes_secret" "tls_cert" {
  metadata {
    name      = "ss-app-tls"
    namespace = "default"
  }

  depends_on = [kubernetes_manifest.selfsigned_certificate]
}

