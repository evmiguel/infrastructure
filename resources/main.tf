module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.2.0"

  name = var.vpc_name
  cidr = var.cidr

  azs             = [for s in var.availability_zones : format("%s%s", var.region, s)]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  tags = {
    Terraform = "true"
  }
}