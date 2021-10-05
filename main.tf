terraform {
  backend "remote" {
    organization = "pradeep349"
  workspaces {
    name = "terraform_prac"
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
s
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           =  var.instance_name
  instance_type = "t2.micro"
}

