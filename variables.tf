variable "aws_profile" {
  type        = string
  description = "AWS Profile"
}

variable "aws_region" {
  type        = string
  description = "AWS Region"
}

variable "cluster_name" {
  type        = string
  description = "EKS Cluster name"
}

variable "tags" {
  type        = map(string)
  description = "Tags for deployment"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for loadbalancer deployment"
}
