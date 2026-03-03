output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

<<<<<<< HEAD
output "eks_cluster_name" {
  description = "EKS Cluster name"
=======
output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "eks_cluster_name" {
  description = "EKS cluster name"
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  value       = module.eks_cluster.cluster_name
}

output "eks_cluster_endpoint" {
<<<<<<< HEAD
  description = "EKS Cluster endpoint"
  value       = module.eks_cluster.cluster_endpoint
}

output "vpn_server_public_ip" {
  description = "VPN Server public IP"
  value       = module.vpn.vpn_server_public_ip
=======
  description = "EKS cluster endpoint"
  value       = module.eks_cluster.cluster_endpoint
}

output "vpn_instance_ip" {
  description = "VPN instance public IP"
  value       = module.vpn.instance_public_ip
}

output "iam_users" {
  description = "Created IAM users"
  value = {
    user1 = module.iam.user1_name
    user2 = module.iam.user2_name
  }
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
}
