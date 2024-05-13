resource "aws_instance" "devops" {
  ami                         = var.aws_ami
  instance_type               = var.aws_instance_type
  key_name                    = var.aws_key_name
  subnet_id                   = module.vpc.public_subnets[1]
  associate_public_ip_address = true

  tags = {
    Name = "nginx"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y nginx
              EOF      
  # Anexa a instância ao grupo de segurança allow_tls
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}