# Here is CODE for the different enivironmnet at a time
# without changing thhe instance again and again 

provider "aws" {
  region = "us-east-1"
}


variable "ami" {
  description = "This is AMI for the instace from modules"
}

variable "instance_type" {
  description = "This is for the instance type"
  type = map(string)

  default = {
    "dev" = "t2.micro"
    "stage" = "t2.medium"
    "prod" = "t2.xlarge"
  }
}
module "ec2_instance" {
  source = "./modules"
  ami=var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}