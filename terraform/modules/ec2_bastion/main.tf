resource "aws_instance" "this" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = element(var.public_subnet_ids, 0)
  vpc_security_group_ids      = [var.security_group_id]
  key_name                    = var.key_pair_name
  associate_public_ip_address = true

  tags = {
    Name        = "${var.project}-${var.environment}-bastion"
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
