variable "ami" {
  description = "AMI ID for the EC2 instance"
  default = "ami-0b6d9d3d33ba97d99"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}


#variable "instance_type" {
#  description = "EC2 instance type"
#  type        = map(string)
#  default = {
#   "dev" = "t3.micro",
 #  "prod" = "t3.medium"
 #}
 #}
