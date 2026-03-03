output "node_group_id" {
  description = "Node group ID"
  value       = aws_eks_node_group.main.id
}

output "node_group_status" {
  description = "Node group status"
  value       = aws_eks_node_group.main.status
}
