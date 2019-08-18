provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAJQ3SCF7WWXHYHZMQ"
  secret_key = "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"
}

resource "aws_instance" "AngulatTestDeploy" {
  ami           = "ami-035b3c7efe6d061d5"
  instance_type = "t2.micro"
  key_name 	= "terraform-jenkins"
} 

