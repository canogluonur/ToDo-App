variable "aws_amis" {
  description = "The AMI to use for setting up the instances."
  default = {
    "eu-central-1" = "ami-053b0d53c279acc90"
  }
}

data "aws_availability_zones" "available" {}

variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "eu-central-1"
}

variable "instance_user" {
  description = "The user account to use on the instances to run the scripts."
  default     = "ubuntu"
}

variable "key_name" {
  description = "Name of the SSH keypair to use in AWS."
  default     = "deploy-docs-k8s"
}

variable "master_instance_type" {
  description = "The instance type to use for the Kubernetes master."
  default     = "t2.micro"
}

variable "node_instance_type" {
  description = "The instance type to use for the Kubernetes nodes.(Free)"
  default     = "t2.micro"
}

variable "node_count" {
  description = "The number of nodes in the cluster."
  default     = "3"
}

variable "private_key_path" {
  description = "The private key for connection to the instances as the user. Corresponds to the key_name variable."
  default     = "~/Desktop/k3s.pem"
}