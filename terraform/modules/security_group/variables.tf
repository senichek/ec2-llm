variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "ssh_cidr" {
  type        = string
  description = "CIDR block allowed to SSH (your IP)"
}
