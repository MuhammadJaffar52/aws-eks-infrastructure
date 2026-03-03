output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "eks_cluster_name" {
  description = "EKS Cluster name"
  value       = module.eks_cluster.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster endpoint"
  value       = module.eks_cluster.cluster_endpoint
}

output "vpn_server_public_ip" {
  description = "VPN Server public IP"
  value       = module.vpn.vpn_server_public_ip
}
