provider "aws" {
region = "ap-south-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-0b09627181c8d5778"
instance_type = "t2.medium"
key_name = "apsouthkeypair"
vpc_security_group_ids = ["sg-0412b221034de5e45"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
