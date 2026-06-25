
======================================================
list → Ordered values, duplicates allowed.
=============================================
set → Unique values, no duplicates.
==============================================
map → Key → Value pairs.
==================================================
tuple → Fixed position + fixed data type.
=================================================
object → Named attributes with multiple data types.
========================================================


POINT 1:
==============
list(string) -> count = 2 loop ->iteration
==============================================

variable "cidr_block " { 
type = list(string)
default = ["10.0.0.1/8", "10.0.11.9/210" ,"10.0.0.1/8"]
}

so call in resource -->  var.cidr_block or if want to run single array var.cidr_block[0]

want to access particaulat item -> [0], [1]


or


A list(string) stores an ordered collection of string values. Unlike a set, a list allows duplicate values and preserves the order of elements.

variable "cidr_blocks" {
  type = list(string)

  default = [
    "10.0.0.0/8",
    "10.0.11.0/24",
    "10.0.0.0/8"
  ]
}
Using the List in a Resource

To use the entire list:

var.cidr_blocks

To access a specific element by its index:

var.cidr_blocks[0]  # First item
var.cidr_blocks[1]  # Second item
var.cidr_blocks[2]  # Third item

==========================================================================================================================

Pint 2 :
=====================

set(string)  -> avoid the duplicate in set 
===================================================


variable "cidr_block " { 
type = set(string)
default = ["us-east-1", eu-west-1", "us-east-1" ]
}

but if you want to access this as list to convert into tolist(var.allowed_region)[0]

or 

A set(string) stores unique string values. If duplicate values are provided, Terraform automatically removes them.

variable "allowed_regions" {
  type = set(string)

  default = [
    "us-east-1",
    "eu-west-1",
    "us-east-1" # Duplicate value
  ]
}


===================================================================================================================

point 3 :  map(string) => key = value single data type only 
================================================================
variable "tags" {
type = map(string)
deafult = {
  env = "dev"
   name = "dev"
   }
}
 call with var.tags --> worksfine 



====================================================================================================================

 point 4 "     tuple never changes  the position 
 ==================================================================

variable "ingress_values" {
  type = tuple([ number, string, number])
  default = [ 443, "tcp",  443 ]
}

for example call in secuirty group like 
|
from_port = var.ingress_values[0] -443
ip_protocol = var.ingress_values[1]
to _port =  var.ingress_values[2]



====================================================================================================================

pont 5 :  object  collection of multiple data type 
================================================================================

variable "config" {
   type = object ({
   region = string,
   monitoring = bool
   instance_count = number
   })

  default = {
   region = "us-east-1",
   monitoring = true,
   instance_count = 2
   }
 }

acces the values   --> region =   var.config.region
                       monitoring =  var.config.monitoring
					   instance_count =  var.config.instance_count

======================================================================================
=
					   






 











