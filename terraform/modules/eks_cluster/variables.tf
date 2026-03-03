variable "project_name" {
<<<<<<< HEAD
  description = "Name of the project"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28"
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for EKS cluster"
  type        = list(string)
}

variable "eks_cluster_role_arn" {
  description = "IAM role ARN for EKS cluster"
=======
  description = "Project name"
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}
<<<<<<< HEAD
=======

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "cluster_role_arn" {
  description = "EKS cluster role ARN"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
