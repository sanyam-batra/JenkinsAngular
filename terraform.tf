provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "AngulatTestDeploy" {
  ami           = "ami-004852354728c0e51"
  instance_type = "t2.micro"
  key_name 	= "sanyam-terraform"
  
  connection {
    user = "ec2-user"
    private_key = "${file("/private_key")}"
    }

} 

