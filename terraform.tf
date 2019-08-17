provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAI7YUN2RUW5ODR5GQ"
  secret_key = "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"
}

resource "aws_instance" "AngulatTestDeploy" {
  ami           = "ami-004852354728c0e51"
  instance_type = "t2.micro"
  key_name 	= "sanyam-terraform"
  
  connection {
    user = "ubuntu"
    private_key = "${file("/private_key")}"
    }

} 

