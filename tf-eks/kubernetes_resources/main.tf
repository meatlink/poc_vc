terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

data "aws_eks_cluster" "eks" {
  name = "eks"
}

provider "kubernetes" {
  host = data.aws_eks_cluster.eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", data.aws_eks_cluster.eks.name]
    command     = "aws"
  }
}

module "namespaces" {
  source = "./namespaces"
  names = ["one", "two", "three"]
}
