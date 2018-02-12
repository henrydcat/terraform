# write outputs only
output "address" { value = "${aws_instance.ec2.public_ip}" }

