variable "cidr_vpc" {
  default = "10.0.0.0/16"
}
variable "aws_amis" {
  default = ""
}
variable "subnet_cidr" {
  type = map(object({
    availability_zone = string
    cidr_block        = string
    tags              = map(string)
  }))
  default = {
    "first" = {
      availability_zone = "ap-south-1a"
      cidr_block        = "10.0.3.0/24"
      tags = {
        Name = "server1"
      }
    }
    "second" = {
      availability_zone = "ap-south-1b"
      cidr_block        = "10.0.4.0/24"
      tags = {
        Name = "server2"
      }
    }
  }
}
