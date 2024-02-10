provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name

  tags = {
    Name        = "rita-bucket345"
    Environment = "Dev"
  }
}

# create a vpc and 2 subnets using variables

# vpc variables:
# cidr: "192.168.0.0/16"
# vpc subnet variables:
# variable subnet1: value: "192.168.10.0/24"
# variable subnet2 value: "192.168.20.0/24"


resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = "vpc-rita345"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = "vpc-07f72f11335c0d4ea"
  cidr_block = var.sub_cidr

  tags = {
    Name = "subnet1"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = "vpc-07f72f11335c0d4ea"
  cidr_block = var.sub2_cidr

  tags = {
    Name = "subnet2"
  }
}


# Create a security group using variables:
# name: var.sg_name
# from_port: var.port
# to_port: var.port

resource "aws_security_group" "allow-ssh" {
  name        = var.sg_name
  description = "Allow ssh inbound traffic and all outbound traffic"
  vpc_id      = "vpc-07f72f11335c0d4ea"

  tags = {
    Name = "allow-ssh"
  }

   ingress {
    from_port        = var.port
    to_port          = var.port
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}


# Create RDS DB instance using terraform, also 
# utilizing variables, with `myvariables.auto.tfvars`` file;
# use aws_db_instance resource
# var.storage: database storage (size 10G)
# var.engine: database engine (mysql)
# var.engine_version: db engine version (5.7)
# var.instance_class: db instance class (db.t3.micro)
# var.username: db username (myadmin)
# var.password: db password (securepassword)
# skip_final_snapshot: true


resource "aws_db_instance" "ritadb" {
  allocated_storage    = var.storage
  db_name              = var.name_db
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true
}