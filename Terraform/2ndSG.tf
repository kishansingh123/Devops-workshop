provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "First-tf-server1" {
    ami = "ami-0a5ac53f63249fba0"
    instance_type = "t2.micro"
    key_name = "firsttfkey"
    security_groups = ["Allow-ssh"]
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"


  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}