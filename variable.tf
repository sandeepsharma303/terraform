variable "instance_type" {
  description = "EC2 instance type"
  type        = map(string)

  default = {
   "dev" = "t3.micro",
   "prod" = "t3.micro"
 }

}
