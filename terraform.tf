provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAJMKVMACSRQYAWGPA"
  secret_key = "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"
}

resource "aws_instance" "AngulatTestDeploy" {
  ami           = "ami-035b3c7efe6d061d5"
  instance_type = "t2.micro"
  key_name 	= "terraform-jenkins"
} 

