variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "ap-south-1" # Mumbai - closest region to India
}

variable "instance_type" {
  description = "EC2 instance type for the k3s node"
  type        = string
  default     = "t3.medium" # k3s + mongo needs a bit more than t3.micro's free-tier 1GB RAM
}

variable "key_pair_name" {
  description = "Name of an existing EC2 key pair for SSH access"
  type        = string
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed to SSH into the instance - restrict this to your own IP in production"
  type        = string
  default     = "0.0.0.0/0" # WARNING: open for portfolio convenience. In a real job, scope this down.
}

variable "project_name" {
  description = "Name prefix used for tagging resources"
  type        = string
  default     = "taskmanager-devops"
}
