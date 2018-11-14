provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_vpc" "demo-vpc" {
  cidr_block = "192.168.0.0/16"
}

resource "aws_internet_gateway" "demo-igw" {
  vpc_id = "${aws_vpc.demo-vpc.id}"
}

resource "aws_route" "internet_access" {
  route_table_id = "${aws_vpc.demo-vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.demo-igw.id}"
}

resource "aws_subnet" "demo-subnet" {
  vpc_id = "${aws_vpc.demo-vpc.id}"
  cidr_block = "192.168.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "elb-sg" {
  name = "elb-sg"
  vpc_id = "${aws_vpc.demo-vpc.id}"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ec2-sg" {
  name = "ec2-sg"
  vpc_id = "${aws_vpc.demo-vpc.id}"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["192.168.0.0/16"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_elb" "demo-elb" {
  name = "demo-elb"
  subnets = ["${aws_subnet.demo-subnet.id}"]
  security_groups = ["${aws_security_group.elb-sg.id}"]
  instances = ["${aws_instance.demo-ec2.id}"]
  connection_draining = true
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    target = "HTTP:80/"
    interval = 30
  }
}

resource "aws_key_pair" "demo-key" {
  key_name = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "demo-ec2" {
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("/root/sandaug.pem")}"
    timeout = "3m"
    agent = false
  }
  instance_type = "t2.micro"
  ami = "${lookup(var.amis,var.region)}"
  key_name = "${aws_key_pair.demo-key.id}"
  vpc_security_group_ids = ["${aws_security_group.ec2-sg.id}"]
  subnet_id = "${aws_subnet.demo-subnet.id}"
  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start",
    ]
  }
}
