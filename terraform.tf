provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAIJ6KPD6ULF4GZYWQ"
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

