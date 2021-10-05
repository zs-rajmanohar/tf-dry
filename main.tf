terraform {
  backend "remote" {
    organization = "pradeep349"
  workspaces {
    name = "terraform_prac"
    }
  }

}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           =  var.instance_name
  instance_type = "t2.micro"
}

