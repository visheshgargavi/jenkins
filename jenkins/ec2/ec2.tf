provider "aws" {
  region                  = "ap-south-1"
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "ap-south-1a"
  tags = {
    Name = "Default subnet"
  }
}

resource "aws_security_group" "secure" {
  name        = "secure"
  description = "Allow HTTP, SSH inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "all"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

  tags = {
    Name = "security-wizard"
  }
}

resource "aws_instance" "k8s-master" {
  ami           = "ami-04db49c0fb2215364"
  instance_type = "t2.micro"
  key_name = "saketsir"

  security_groups = [ "${aws_security_group.secure.name}" ]
  tags = {
    Name = "Master"
  }
}

resource "aws_instance" "k8s-slave" {
  ami = "ami-04db49c0fb2215364"
  instance_type = "t2.micro"
  key_name = "saketsir"
  #count = 1
  security_groups = [ "${aws_security_group.secure.name}" ]
  tags = {
    Name = "Slaves"
  }
}

# Creating a Local file, which contains Public IP's of our Cluster INstanc`es
 resource "local_file" "ipfile" {
     content = "[aws] \n${aws_instance.k8s-master.public_ip}  ansible_user=ec2-user  \n\n [aws1] \n${aws_instance.k8s-slave.public_ip} ansible_user=ec2-user"
     filename = "ip.txt"
 }

 output "ip_data" {
    value = "[aws] \n${aws_instance.k8s-master.public_ip}  ansible_user=ec2-user  \n\n[aws1] \n${aws_instance.k8s-slave.public_ip} ansible_user=ec2-user"
}
