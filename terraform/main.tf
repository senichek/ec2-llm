module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr_block      = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones  = ["us-east-1a", "us-east-1b"]
  project             = "LLM-ec2-box"
  environment         = "dev"
}

module "ec2_sg" {
  source      = "./modules/security_group"
  project     = "llm"
  environment = "dev"
  vpc_id      = module.vpc.vpc_id
  ssh_cidr    = "xx.xxx.xxx.xx/32" # Replace with your real IP (YOUR_IP/32)
}

