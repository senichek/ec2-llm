resource "aws_security_group" "this" {
  name        = "${var.project}-${var.environment}-ec2-sg"
  description = "Security group for EC2 running LLM"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH from your IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ssh_cidr]
  }

  ingress {
    description = "Allow HTTP from ALB"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [var.alb_sg_id]  # <-- This will be passed from ALB module
  }


  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project}-${var.environment}-ec2-sg"
    Project     = var.project
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
