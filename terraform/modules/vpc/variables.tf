variable "project_name" {
<<<<<<< HEAD
  description = "Name of the project"
=======
  description = "Project name"
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  type        = string
}

variable "vpc_cidr" {
<<<<<<< HEAD
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
=======
  description = "VPC CIDR block"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
}

variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
<<<<<<< HEAD
  default     = ["us-west-2a", "us-west-2b"]
=======
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
}
