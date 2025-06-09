variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "instance_profile_name" {
  type        = string
  description = "IAM instance profile name"
  default     = null
}

variable "key_pair_name" {
  type = string
}

