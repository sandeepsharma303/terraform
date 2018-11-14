output "web" {
  value = "${aws_elb.demo-elb.dns_name}"
}

