aws_region              = "us-east-1"
vpc_name                = "vpc-nginx"
vpc_cidr                = "10.0.0.0/16"
vpc_azs                 = ["us-east-1a", "us-east-1b", "us-east-1c"]
aws_vpc_private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
aws_vpc_public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
aws_instance_type       = "t2.micro"
aws_key_name            = "devops"
aws_ami                 = "ami-04b70fa74e45c3917"
aws_project_tags = {
  ec2         = "nginx"
  Environment = "dev"
}