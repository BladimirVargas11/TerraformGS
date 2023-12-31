terraform {
  backend "remote" {
    organization = "bjvargas"

    workspaces {
      name = "bladimir-vargas11-project"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami                    = "ami-08d70e59c07c61a3a"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-00a582bf448a3d5ed"
  vpc_security_group_ids = ["sg-02cd7592ec280fcbe"]
  tags = {
    Name = var.instance_name
  }
}
