
locals {
  key_name = "${var.project}-${var.environment}"
}


resource "aws_key_pair" "ec2-key" {
  key_name   = local.key_name
  public_key = file("C:/Users/USER_NAME/.ssh/${local.key_name}.pub")
}

