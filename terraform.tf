provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAITIRTJVNPJUN634Q"
  secret_key = "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"
}

resource "aws_instance" "AngulatTestDeploy" {
  ami           = "ami-035b3c7efe6d061d5"
  instance_type = "t2.micro"
  key_name 	= "terraform-jenkins"
} 

