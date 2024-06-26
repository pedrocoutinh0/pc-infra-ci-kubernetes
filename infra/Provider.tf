terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.40"
    }
  }

  required_version = ">= 1.3.2"
}

provider "aws" {
  region  = "sa-east-1"
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.eks_managed_node_groups.cluster_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", var.cluster_name]
    command     = "aws"
  }
}

resource "kubernetes_service" "lb" {
  metadata {
    name = "load-balancer-nest-api"
  }
  spec {
    selector = {
      nome = "nest"
    }
    port {
      port = 3000
      target_port = 3000
    }
    type = "LoadBalancer"
  }
}
