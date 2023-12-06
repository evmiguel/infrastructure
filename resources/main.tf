module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.2.0"

  name = "erika-vpc"
  cidr = "10.0.0.0/16"

  azs             = [for s in var.availability_zones : format("%s%s",var.region,s)]
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  tags = {
    Terraform = "true"
  }
}