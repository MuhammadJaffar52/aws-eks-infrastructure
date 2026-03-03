<<<<<<< HEAD
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
=======
# EKS Node Group - Free Tier Optimized
resource "aws_eks_node_group" "main" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-nodes"
  node_role_arn   = var.nodes_role_arn
  subnet_ids      = var.private_subnet_ids
  instance_types  = ["t3.small"]
  disk_size       = 50  # Increased from default 20GB to 50GB

  scaling_config {
    desired_size = 2  # Updated to 2 nodes
    max_size     = 2
    min_size     = 1
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  }

  update_config {
    max_unavailable = 1
  }

  tags = {
<<<<<<< HEAD
    Name = "${var.project_name}-nodes"
=======
    Name = "${var.project_name}-node-group"
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  }
}
