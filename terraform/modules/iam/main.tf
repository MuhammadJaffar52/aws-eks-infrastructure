<<<<<<< HEAD
# ─────────────────────────────────────────
# EKS CLUSTER ROLE
# ─────────────────────────────────────────
=======
# IAM Users
resource "aws_iam_user" "user1" {
  name = "user1"
  tags = {
    Name  = "user1"
    Email = "user1@example.com"
  }
}

resource "aws_iam_user" "user2" {
  name = "user2"
  tags = {
    Name  = "user2"
    Email = "user2@example.com"
  }
}

# EKS Cluster Role
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.project_name}-eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
<<<<<<< HEAD

  tags = {
    Name = "${var.project_name}-eks-cluster-role"
  }
}

# ─────────────────────────────────────────
# ATTACH POLICY TO EKS CLUSTER ROLE
# ─────────────────────────────────────────
=======
}

>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

<<<<<<< HEAD
# ─────────────────────────────────────────
# EKS NODES ROLE
# ─────────────────────────────────────────
=======
# EKS Node Group Role
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
resource "aws_iam_role" "eks_nodes_role" {
  name = "${var.project_name}-eks-nodes-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
<<<<<<< HEAD

  tags = {
    Name = "${var.project_name}-eks-nodes-role"
  }
}

# ─────────────────────────────────────────
# ATTACH POLICIES TO EKS NODES ROLE
# ─────────────────────────────────────────
=======
}

>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks_nodes_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks_nodes_role.name
}

<<<<<<< HEAD
resource "aws_iam_role_policy_attachment" "eks_ecr_policy" {
=======
resource "aws_iam_role_policy_attachment" "eks_container_registry_policy" {
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks_nodes_role.name
}
