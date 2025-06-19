resource "aws_key_pair" "ec2-key" {
  key_name   = "${var.project}-${var.environment}"
  public_key = var.public_key_loc
}
