resource "tls_private_key" "ec2" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2" {
  key_name   = "${var.project}-${var.environment}-key"
  public_key = tls_private_key.ec2.public_key_openssh
}
