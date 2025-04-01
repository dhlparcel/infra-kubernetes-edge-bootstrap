resource "kubernetes_manifest" "selfsigned_clusterissuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "selfsigned-cluster-issuer"
    }
    spec = {
      selfSigned = {}
    }
  }

  depends_on = [helm_release.cert-manager]
}

resource "kubernetes_manifest" "selfsigned_certificate" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "Certificate"
    metadata = {
      name      = "my-selfsigned-cert"
      namespace = "default"
    }
    spec = {
      secretName = "ss-app-tls"
      commonName = var.common_name
      dnsNames   = var.dns_names
      issuerRef = {
        name = kubernetes_manifest.selfsigned_clusterissuer.manifest["metadata"]["name"]
        kind = "ClusterIssuer"
      }
    }
  }
  depends_on = [kubernetes_manifest.selfsigned_clusterissuer]
}

