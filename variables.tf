variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  description = "The name of the key pair"
  type        = string
  default     = ""
}

variable "public_key_path" {
  description = "The path to the public key file"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The type of instance to use"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = ""
}
