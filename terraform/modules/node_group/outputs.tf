<<<<<<< HEAD
output "node_group_id" {
  description = "Node group ID"
  value       = aws_eks_node_group.main.id
}

output "node_group_status" {
  description = "Node group status"
=======
output "node_group_arn" {
  description = "EKS node group ARN"
  value       = aws_eks_node_group.main.arn
}

output "node_group_status" {
  description = "EKS node group status"
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  value       = aws_eks_node_group.main.status
}
