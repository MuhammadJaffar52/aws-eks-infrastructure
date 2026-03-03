# ─────────────────────────────────────────
# EKS NODE GROUP
# ─────────────────────────────────────────
resource "aws_eks_node_group" "main" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-nodes"
  node_role_arn   = var.eks_nodes_role_arn
  subnet_ids      = var.private_subnet_ids
  instance_types  = [var.instance_type]
  disk_size       = var.disk_size
  ami_type        = "AL2_x86_64"


  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
    Name = "${var.project_name}-nodes"
  }
}
