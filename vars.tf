# use this file to define vars

# aws 
variable "region" { 
  description = "default region"
  default = "us-west-2"
}
variable "zones" { default = [ "us-west-2a" ] }
variable "vpcId" { description = "default vpc_id" 
  default  = "vpc-6860750a"
}

# account
variable "key" { type = "string", default = "myKey" }

# host
variable "hostName" { default = "busyme" }
variable "amiId" { default = "ami-a042f4d8" }
variable "instanceType" { default = "t2.micro" }

# aplication
variable "server_port" { description = "port for http", default = 8080 }

# networking
variable "comcastIp" {
  description = "ips of proxy addresses"
  default = "xxxxx"
}
variable "proxyIps" {
  description = "ips of proxy servers"
  default = "xxxx"
}
