module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.1"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.aws_vpc_private_subnets
  public_subnets  = var.aws_vpc_public_subnets

  enable_nat_gateway   = true
  enable_vpn_gateway   = true
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = var.aws_project_tags

}
