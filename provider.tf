terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "< 3"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "< 3"
    }
  }
}

provider "kubernetes" {
  config_path = var.kubeconfig
}

provider "helm" {
  kubernetes {
    config_path = var.kubeconfig
  }
}
