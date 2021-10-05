resource "aws_vpc" "vpc" {
  cidr_block              = "${var.vpc-cidr}"
  instance_tenancy        = "default"
  enable_dns_hostnames    = true

  tags      = {
    Name    = "Terraform_VPC"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "IGW"
  }
}
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.public-subnet-1-cidr}"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "Public Subnet 1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.public-subnet-2-cidr}"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "Public Subnet 2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "${var.public-subnet-3-cidr}"
  availability_zone       = "us-east-1c"
  map_public_ip_on_launch = true

  tags      = {
    Name    = "Public Subnet 3"
  }
}

resource "aws_route_table" "public-route-table" {
  vpc_id       = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags       = {
    Name     = "Public Route Table"
  }
}

resource "aws_route_table_association" "public-subnet-1-route-table" {
  subnet_id           = aws_subnet.public-subnet-1.id
  route_table_id      = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-subnet-2-route-table" {
  subnet_id           = aws_subnet.public-subnet-2.id
  route_table_id      = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "public-subnet-3-route-table" {
  subnet_id           = aws_subnet.public-subnet-3.id
  route_table_id      = aws_route_table.public-route-table.id
}

resource "aws_route_table_association" "private-subnet-1-route-table" {
  subnet_id           = aws_subnet.private-subnet-1.id
  route_table_id      = aws_route_table.Private-route-table.id
}

resource "aws_route_table_association" "private-subnet-2-route-table" {
  subnet_id           = aws_subnet.private-subnet-2.id
  route_table_id      = aws_route_table.Private-route-table.id
}

resource "aws_route_table_association" "private-subnet-3-route-table" {
  subnet_id           = aws_subnet.private-subnet-3.id
  route_table_id      = aws_route_table.Private-route-table.id
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = "${var.private-subnet-1-cidr}"
  availability_zone        = "us-east-1a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private Subnet 1 | App Tier"
  }
}
resource "aws_subnet" "private-subnet-2" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = "${var.private-subnet-2-cidr}"
  availability_zone        = "us-east-1b"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private Subnet 2 | App Tier"
  }
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id                   = aws_vpc.vpc.id
  cidr_block               = "${var.private-subnet-3-cidr}"
  availability_zone        = "us-east-1a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "Private Subnet 3 | Database Tier"
  }
}
