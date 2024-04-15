# Please Check the main_2.tf as it is written in the
# modular code for different enivironment. 

provider "aws" {
    region = "us-east-1"
  
}

variable "ami" {
  description = "This is AMI for the instace"
}

variable "instance_type" {
  description = "This is for the instance type"

}

variable "key_name_value" {
  description = "This is the key value pair for the ec2"
}

resource "aws_instance" "example" {
  ami= var.ami
  instance_type = var.instance_type
  key_name = var.key_name_value
  tags = {
    Name = "trying-for workspace_stageENV-sumay"
  }
}