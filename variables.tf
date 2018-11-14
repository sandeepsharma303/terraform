variable "access_key" {
  default = "AKIAJWBUEHKEPCWZDVPQ"
}

variable "secret_key" {
  default = "4CSmGSK8AAdLdQgixMeOV9GTFFAUi+haZIj1al7i"
}

variable "region" {
  default = "ap-south-1"
}

variable "key_name" {
  description = "Name of AWS key pair"
  default = "sandaug.pem"
}

variable "public_key_path" {
 description = "Path to my public key"
  default = "/home/ec2-user/.ssh/authorized_keys"
}

variable "amis" {
  type = "map"
  default = {
   ap-south-1 = "ami-06418a07c404e3770"
  }
}

variable "instancetype" {
  default = "t2.micro"
}

