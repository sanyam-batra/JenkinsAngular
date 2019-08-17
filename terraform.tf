provider "aws" {
  region     = "us-east-1"
}

resource "aws_instance" "AngulatTestDeploy" {
  ami           = "ami-035b3c7efe6d061d5"
  instance_type = "t2.micro"
  key_name 	= "sanyam-terraform"
  
  provisioner "file" {
  source      = "/var/jenkins_home/workspace/Jenkins_Angular/dockerexec.sh"
  destination = "/dockerexec.sh"
  connection {
    type     = "ssh"
    user     = "ubuntu"
    password = "ubuntu"

    }
}

} 

