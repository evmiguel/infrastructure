resource "aws_security_group" "site_security_group" {
  name        = "site_sg"
  description = "Allow HTTP and HTTPS traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "SSH traffic"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidrs
  }

  ingress {
    description = "HTTPS traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP traffic"
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

  tags = {
    Name = "site_sg"
  }
}

data "aws_key_pair" "site_key" {
  key_name           = "docker-server"
  include_public_key = true
}

resource "aws_instance" "site" {
  ami                         = var.ami
  instance_type               = var.instance_type
  associate_public_ip_address = true
  subnet_id                   = module.vpc.public_subnets[0]
  vpc_security_group_ids      = [aws_security_group.site_security_group.id]
  key_name                    = data.aws_key_pair.site_key.key_name
  tags = {
    Name      = "personal-site"
    Terraform = true
  }
}
