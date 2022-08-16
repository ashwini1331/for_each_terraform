provider "aws" {
  region = "ap-south-1"
}
resource "aws_instance" "web" {
  for_each                    = var.subnet_cidr
  ami                         = var.aws_amis
  instance_type               = "t2.micro"
  key_name                    = "test"
  subnet_id                   = aws_subnet.websubnet[each.key].id
  associate_public_ip_address = true
  tags                        = each.value["tags"]
}
resource "aws_vpc" "webvpc" {
  cidr_block = var.cidr_vpc
  tags = {
    Name = "webvpc"
  }
}
resource "aws_subnet" "websubnet" {
  for_each                = var.subnet_cidr
  vpc_id                  = aws_vpc.webvpc.id
  cidr_block              = each.value["cidr_block"]
  availability_zone       = each.value["availability_zone"]
  map_public_ip_on_launch = true
  tags                    = each.value["tags"]
}
