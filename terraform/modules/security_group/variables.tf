variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "bastion_sg_id" {
  type        = string
  description = "CIDR block allowed to SSH"
}

variable "alb_sg_id" {
  type = string
}
