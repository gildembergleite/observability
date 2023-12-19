provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "observability" {
  ami           = "ami-0759f51a90924c166"
  instance_type = "t2.micro"
  key_name      = "new-terraform-key"

  tags = {
    Name = "Atividade-Observability"
  }
}
