# Create a VPC for the region associated with the AZ
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
 
  tags = {
    Name        = "pradeep-${var.infra_env}-vpc"
    Project     = "pradeep_prac"
    Environment = var.infra_env
    ManagedBy   = "terraform"
  }
}
 
# Create 1 public subnets for each AZ within the regional VPC
resource "aws_subnet" "public" {
  for_each = var.public_subnet
 
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key
 
  # 2,048 IP addresses each
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
 
  tags = {
    Name        = "pradeep-${var.infra_env}-vpc"
    Project     = "pradeep_prac"
    Role        = "public"
    Environment = var.infra_env
    ManagedBy   = "terraform"
    Subnet      = "${each.key}-${each.value}"
  }
}
 
# Create 1 private subnets for each AZ within the regional VPC
resource "aws_subnet" "private" {
  for_each = var.private_subnet
 
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key
 
  # 2,048 IP addresses each
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
 
  tags = {
    Name        = "pradeep-${var.infra_env}-vpc"
    Project     = "pradeep_prac"
    Role        = "private"
    Environment = var.infra_env
    ManagedBy   = "terraform"
    Subnet      = "${each.key}-${each.value}"
  }
}




# resource "aws_vpc" "sample_vpc" {
#     cidr_block = var.vpc_cidr

#     tags = {
#        Name        = "default-${var.infra_env}-vpc"
#        Project     = "pradeep_terraform_prac"
#        environment = var.infra_env
#        ManagedBy   = "terraform"

#     }
  
# }
# resource "aws_subnet" "public" {

#     for_each = var.public_subnet
#     vpc_id = aws_vpc.vpc_id

#     cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4 , each.value)

#     tags = {
#        Name        = "default-${var.infra_env}-public-subnet"
#        Project     = "pradeep_terraform_prac"
#        environment = var.infra_env
#        ManagedBy   = "terraform"
#        Role        = "public"
#        subnet      = "${each.key}-${each.value}"
#     }
  
# }

 