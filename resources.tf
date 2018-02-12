# resources only 

provider "aws" { region = "${var.region}" }

resource "aws_security_group" "sg1" {
  name="${var.hostName}-sg"
  vpc_id      = "${var.vpcId}"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "source IP"
    cidr_blocks = ["${var.comcastIp}"]
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    description = "VPN"
    cidr_blocks = ["${var.proxyIps}"]
  }
    egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  tags { Name = "${var.hostName}" }
  lifecycle { create_before_destroy = true }
}
  
resource "aws_instance" "ec2" {
  ami = "${var.amiId}"
  instance_type = "${var.instanceType}"
  vpc_security_group_ids = ["${aws_security_group.sg1.id}"]
  key_name = "${var.key}"
  user_data = <<-EOF
    #!/bin/bash
    echo "hello world" >~/index.html
    curl -O https://www.busybox.net/downloads/binaries/1.26.2-i686/busybox 
    mv busybox ~/
    chmod 766 ~/busybox
    cd
    nohup ~/busybox httpd -f -h /root -p "${var.server_port}" &   
    EOF
  lifecycle { create_before_destroy = true }
}

