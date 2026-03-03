<<<<<<< HEAD
variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "infra-env"
}

=======
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

<<<<<<< HEAD
=======
variable "project_name" {
  description = "Project name"
  type        = string
  default     = "infra-env"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "key_name" {
  description = "EC2 Key Pair name"
  type        = string
  default     = "infra-keypair"
}

>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.28"
}
<<<<<<< HEAD

variable "key_name" {
  description = "SSH key pair name"
  type        = string
  default     = "oregon"
}

variable "instance_type_nodes" {
  description = "EC2 instance type for EKS nodes"
  type        = string
  default     = "t3.small"
}

variable "instance_type_vpn" {
  description = "EC2 instance type for VPN server"
  type        = string
  default     = "t3.micro"
}

variable "desired_size" {
  description = "Desired number of EKS nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of EKS nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of EKS nodes"
  type        = number
  default     = 2
}

=======
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
