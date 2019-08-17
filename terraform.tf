provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAJB6M4RZB64SAHVHA"
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

