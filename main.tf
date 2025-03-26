provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-08b5b3a93ed654d19"
instance_type = "t2.medium"
key_name = "virginiakeypair"
vpc_security_group_ids = ["sg-0eceb708685fbc8d4"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "AppServer-1", "AppServer-2", "Monitoring server"]
}
