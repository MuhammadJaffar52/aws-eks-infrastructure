<<<<<<< HEAD
# ─────────────────────────────────────────
# VPC
# ─────────────────────────────────────────
=======
# VPC
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "${var.project_name}-vpc"
  }
}

<<<<<<< HEAD
# ─────────────────────────────────────────
# PUBLIC SUBNETS
# ─────────────────────────────────────────
resource "aws_subnet" "public" {
  count                   = length(var.public_subnet_cidrs)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name                                                 = "${var.project_name}-public-subnet-${count.index + 1}"
    "kubernetes.io/role/elb"                             = "1"
    "kubernetes.io/cluster/${var.project_name}-cluster" = "shared"
  }
}

# ─────────────────────────────────────────
# PRIVATE SUBNETS
# ─────────────────────────────────────────
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name                                                 = "${var.project_name}-private-subnet-${count.index + 1}"
    "kubernetes.io/role/internal-elb"                    = "1"
    "kubernetes.io/cluster/${var.project_name}-cluster" = "shared"
  }
}

# ─────────────────────────────────────────
# INTERNET GATEWAY
# ─────────────────────────────────────────
=======
# Internet Gateway
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

<<<<<<< HEAD
# ─────────────────────────────────────────
# ELASTIC IP FOR NAT GATEWAY
# ─────────────────────────────────────────
resource "aws_eip" "nat" {
  domain = "vpc"

=======
# Public Subnets
resource "aws_subnet" "public" {
  count = length(var.public_subnet_cidrs)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.project_name}-public-subnet-${count.index + 1}"
    Type = "Public"
  }
}

# Private Subnets
resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = "${var.project_name}-private-subnet-${count.index + 1}"
    Type = "Private"
  }
}

# NAT Gateway
resource "aws_eip" "nat" {
  domain = "vpc"
  
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  tags = {
    Name = "${var.project_name}-nat-eip"
  }
}

<<<<<<< HEAD
# ─────────────────────────────────────────
# NAT GATEWAY
# ─────────────────────────────────────────
=======
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "${var.project_name}-nat-gateway"
  }

  depends_on = [aws_internet_gateway.main]
}

<<<<<<< HEAD
# ─────────────────────────────────────────
# PUBLIC ROUTE TABLE
# ─────────────────────────────────────────
=======
# Route Tables
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

<<<<<<< HEAD
# ─────────────────────────────────────────
# PRIVATE ROUTE TABLE
# ─────────────────────────────────────────
=======
>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-private-rt"
  }
}

<<<<<<< HEAD
# ─────────────────────────────────────────
# PUBLIC ROUTE TABLE ASSOCIATIONS
# ─────────────────────────────────────────
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public)
=======
# Route Table Associations
resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)

>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}

<<<<<<< HEAD
# ─────────────────────────────────────────
# PRIVATE ROUTE TABLE ASSOCIATIONS
# ─────────────────────────────────────────
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
=======
resource "aws_route_table_association" "private" {
  count = length(aws_subnet.private)

>>>>>>> e956ddd644047610224b3306fdb3ae99740b3827
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}
