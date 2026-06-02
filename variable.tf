variable "ami" {
  description = "This is the AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0abed25eed793978d"
}

variable "instance_type" {
  description = "This is the instance type"
  type        = string
  default     = "t4g.small"

}

variable "environment" {
  description = "The environment for the EC2 instance"
  type        = string
  default     = "uat"
}

variable "project" {
  description = "The project name for the EC2 instance"
  type        = string
  default     = "cloud-tux"

}

