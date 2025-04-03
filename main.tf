provider "aws" {
  region = var.region # Replace with your desired region
}

resource "aws_key_pair" "example_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path) # Use the correct public key file
}

resource "aws_instance" "grafana_instance" {
  ami           = var.ami_id # Replace with your desired AMI ID
  instance_type = var.instance_type

  key_name        = aws_key_pair.example_key.key_name
  security_groups = [aws_security_group.grafana_sg.name]

  tags = {
    Name = "grafana-instance"
  }
}

resource "aws_security_group" "grafana_sg" {
  name        = "grafana-sg"
  description = "Allow SSH and HTTP traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

