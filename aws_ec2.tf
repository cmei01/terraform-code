provider "aws" {
  region = "us-east-2"
}
resource "aws_instance" "example" {
    ami = "ami-051f8a213df8bc089"
    instance_type = "t2.micro"
}