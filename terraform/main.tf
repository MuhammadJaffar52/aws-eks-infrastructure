terraform {
<<<<<<< HEAD
=======
  required_version = ">= 1.0"
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
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

<<<<<<< HEAD
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
=======
data "aws_availability_zones" "available" {
  state = "available"
}

# IAM Module - Create users first
module "iam" {
  source = "./modules/iam"
  
  project_name = var.project_name
}

# VPC Module
module "vpc" {
  source = "./modules/vpc"
  
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  availability_zones    = slice(data.aws_availability_zones.available.names, 0, 2)
}

# EKS Cluster Module
module "eks_cluster" {
  source = "./modules/eks_cluster"
  
  project_name       = var.project_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  cluster_role_arn   = module.iam.eks_cluster_role_arn
  kubernetes_version = var.kubernetes_version
  
  depends_on = [module.vpc, module.iam]
}

# Node Group Module
module "node_group" {
  source = "./modules/node_group"
  
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.cluster_name
  private_subnet_ids = module.vpc.private_subnet_ids
  nodes_role_arn    = module.iam.eks_nodes_role_arn
  
  depends_on = [module.eks_cluster]
}

# VPN Module
module "vpn" {
  source = "../vpn"
  
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  project_name     = var.project_name
  vpc_id           = module.vpc.vpc_id
  public_subnet_id = module.vpc.public_subnet_ids[0]
  key_name         = var.key_name
<<<<<<< HEAD
  instance_type    = var.instance_type_vpn
}

=======
  
  depends_on = [module.vpc]
}
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
