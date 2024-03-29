terraform {
  backend "remote" {
    organization = "raj21"
  workspaces {
    name = "terraform_local"
    }
  }
  required_providers {
  aws = {
    source  = "hashicorp/aws"
    version = "~> 3.27"
    }
 }

  required_version = ">= 0.14.9"
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = var.Ec2_ami
  instance_type = "t2.micro"
}

