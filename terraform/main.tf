locals {
  project     = "llm-ec2-box"
  environment = "dev"
}


module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr_block      = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b"]
  project             = local.project
  environment         = local.environment
}

module "ec2_sg" {
  source      = "./modules/security_group"
  project     = local.project
  environment = local.environment
  vpc_id      = module.vpc.vpc_id
  ssh_cidr    = "xx.xxx.xxx.xx/32" # Replace with your real IP (YOUR_IP/32)
  alb_sg_id   = module.alb_sg.alb_sg_id
}

module "alb_sg" {
  source      = "./modules/security_group_alb"
  project     = local.project
  environment = local.environment
  vpc_id      = module.vpc.vpc_id
}

module "key_pair" {
  source      = "./modules/key_pair"
  project     = local.project
  environment = local.environment
}

module "ec2" {
  source              = "./modules/ec2"
  ami_id              = "ami-0731becbf832f281e"
  instance_type       = "t2.micro"              # or g4dn.xlarge for GPU inference
  private_subnet_ids  = module.vpc.private_subnet_ids
  security_group_id   = module.ec2_sg.security_group_id
  project             = local.project
  environment         = local.environment
  instance_profile_name = null
  key_pair_name       = module.key_pair.key_name
}

module "alb" {
  source            = "./modules/alb"
  project           = local.project
  environment       = local.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  ec2_instance_id   = module.ec2.instance_id
  alb_sg_id         = module.alb_sg.alb_sg_id
}



