variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}


variable "vpc_id" {
  type = string
}
variable "environment" {
    type = string
}

variable "subnets" {
  type        = list(string)
}