variable "region" {
  description = "Region in AWS"
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
}

variable "ami_id" {
  description = "AMI id"
  type = string
}


variable "vpc1_id" {
  description = "VPC id"
  type = string
}


variable "internet_gateway_id" {
  description = "Gateway id"
  type = string
}

variable "key1" {
  description = "KEY"
  type = string
}
