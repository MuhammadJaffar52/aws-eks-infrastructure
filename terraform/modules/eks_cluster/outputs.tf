output "cluster_name" {
<<<<<<< HEAD
  description = "EKS Cluster name"
=======
  description = "EKS cluster name"
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
<<<<<<< HEAD
  description = "EKS Cluster endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_certificate_authority" {
  description = "EKS Cluster certificate authority"
  value       = aws_eks_cluster.main.certificate_authority[0].data
}

output "cluster_security_group_id" {
  description = "EKS Cluster security group ID"
  value       = aws_security_group.eks_cluster_sg.id
=======
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_arn" {
  description = "EKS cluster ARN"
  value       = aws_eks_cluster.main.arn
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
}
