provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAI7YUN2RUW5ODR5GQ"
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

