terraform {
  required_version = " ~> 1.4.5"

  backend "s3" {
     bucket         = "eks-hand-on-series-20092023"
     key            = "tf-aws-bootstrap/terraform.tfstate"
     region         = "ap-southeast-1"
     dynamodb_table = "terraform-lock-state-20092023"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.20.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.9.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14"
    }
  }
}