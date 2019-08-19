provider "aws" {
  region     = "us-east-1"
}

resource "aws_vpc" "test-env" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "test-env"
  }
}


resource "aws_subnet" "subnet-uno" {
  cidr_block = "${cidrsubnet(aws_vpc.test-env.cidr_block, 3, 1)}"
  vpc_id = "${aws_vpc.test-env.id}"
  availability_zone = "us-east-1a"
}


resource "aws_security_group" "ingress-all-test" {
name = "allow-all-sg"
vpc_id = "${aws_vpc.test-env.id}"
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}


resource "aws_instance" "test-ec2-instance" {
  ami = "ami-035b3c7efe6d061d5"
  instance_type = "t2.micro"
  key_name = "terraform-jenkins"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
  subnet_id = "${aws_subnet.subnet-uno.id}"
  connection {
    user = "ec2-user"
    host = "${self.public.ip}"
    private_key = "${file("/terraform-jenkins(1).pem")}"
    }
  provisioner "file" {
    source = "/dockerexec.sh"
    destination = "/home/ec2-user/dockerexec.sh"
    }

}


resource "aws_instance" "prod-ec2-instance" {
  ami = "ami-035b3c7efe6d061d5"
  instance_type = "t2.micro"
  key_name = "terraform-jenkins"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
  subnet_id = "${aws_subnet.subnet-uno.id}"

}


resource "aws_eip" "ip-test-env" {
  instance = "${aws_instance.test-ec2-instance.id}"
  vpc      = true
}

resource "aws_eip" "ip-prod-env" {
  instance = "${aws_instance.prod-ec2-instance.id}"
  vpc      = true
}


resource "aws_internet_gateway" "test-env-gw" {
  vpc_id = "${aws_vpc.test-env.id}"
tags = {
    Name = "test-env-gw"
  }
}

resource "aws_route_table" "route-table-test-env" {
  vpc_id = "${aws_vpc.test-env.id}"
route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.test-env-gw.id}"
  }
tags = {
    Name = "test-env-route-table"
  }
}
resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.subnet-uno.id}"
  route_table_id = "${aws_route_table.route-table-test-env.id}"
}
