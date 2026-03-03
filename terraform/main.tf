terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# ─────────────────────────────────────────
# VPC MODULE
# ─────────────────────────────────────────
module "vpc" {
  source       = "./modules/vpc"
  project_name = var.project_name
}

# ─────────────────────────────────────────
# IAM MODULE
# ─────────────────────────────────────────
module "iam" {
  source       = "./modules/iam"
  project_name = var.project_name
}

# ─────────────────────────────────────────
# EKS CLUSTER MODULE
# ─────────────────────────────────────────
module "eks_cluster" {
  source               = "./modules/eks_cluster"
  project_name         = var.project_name
  kubernetes_version   = var.kubernetes_version
  private_subnet_ids   = module.vpc.private_subnet_ids
  eks_cluster_role_arn = module.iam.eks_cluster_role_arn
  vpc_id               = module.vpc.vpc_id
}

# ─────────────────────────────────────────
# NODE GROUP MODULE
# ─────────────────────────────────────────
module "node_group" {
  source             = "./modules/node_group"
  project_name       = var.project_name
  cluster_name       = module.eks_cluster.cluster_name
  eks_nodes_role_arn = module.iam.eks_nodes_role_arn
  private_subnet_ids = module.vpc.private_subnet_ids
  instance_type      = var.instance_type_nodes
  desired_size       = var.desired_size
  min_size           = var.min_size
  max_size           = var.max_size
}

# ─────────────────────────────────────────
# VPN MODULE
# ─────────────────────────────────────────
module "vpn" {
  source           = "./modules/vpn"
  project_name     = var.project_name
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]
  key_name         = var.key_name
  instance_type    = var.instance_type_vpn
}

