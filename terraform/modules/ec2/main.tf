resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = element(var.private_subnet_ids, 0)
  vpc_security_group_ids = [var.security_group_id]
  iam_instance_profile   = var.instance_profile_name # optional
  associate_public_ip_address = false

  user_data = file("${path.module}/user_data.sh")

  tags = {
    Name        = "${var.project}-${var.environment}-llm-ec2"
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
