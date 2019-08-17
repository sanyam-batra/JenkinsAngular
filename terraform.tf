provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAI7VFL6GH3627IK7A"
  secret_key = "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"
}

resource "aws_instance" "AngulatTestDeploy" {
  ami           = "ami-035b3c7efe6d061d5"
  instance_type = "t2.micro"
  key_name 	= "sanyam-terraform"
  
  connection {
    user = "ec2-user"
    private_key = "${file("/private_key")}"
    }

} 

