variable "project_name" {
<<<<<<< HEAD
  description = "Name of the project"
=======
  description = "Project name"
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

<<<<<<< HEAD
variable "eks_nodes_role_arn" {
  description = "IAM role ARN for EKS nodes"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for node group"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type for nodes"
  type        = string
  default     = "t3.small"
}

variable "disk_size" {
  description = "Disk size for nodes in GB"
  type        = number
  default     = 50
}

variable "desired_size" {
  description = "Desired number of nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 2
}

=======
variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "nodes_role_arn" {
  description = "EKS nodes role ARN"
  type        = string
}
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
