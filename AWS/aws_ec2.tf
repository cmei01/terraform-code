provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
    ami = "ami-051f8a213df8bc089"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.allow_egress.id, aws_security_group.Allow_SSH.id,aws_security_group.instance.id]

    user_data = <<-EOF
            #!/bin/bash
            echo "Hello World!" > index.html
            nohup busybox httpd -f -p 8080 &
            EOF
    user_data_replace_on_change = true

    tags = {
        Name = "Terraform-deployed-ec2"
    }
}

resource "aws_security_group" "instance" { 
    name = "terraform-example-instance"
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    } 
}

resource "aws_security_group" "Allow_SSH" {
    name = "terraform-ssh-instance"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "allow_egress" {
    name = "Allow Egress"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

output "public_ip" {
  value = aws_instance.example.public_ip
  description = "The public IP of the web server"
}