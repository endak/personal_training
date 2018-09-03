#configure provider
provider "aws" {
    shared_credentials_file = "$HOME/.aws/credentials/hippogriffin-aws-secret"
    region = "eu-west-1"
    allowed_account_ids = [
    "515741873100",
  ]
}

#configure vpc
resource "aws_vpc" "hippogriffin-vpc" {
   cidr_block = "10.0.0.0/16"

   tags {
       Name = "hippogriffin-VPC"
   }
}

#configure subnet
resource "aws_subnet" "hippogriffin-subnet" {
    vpc_id = "${aws_vpc.hippogriffin-vpc.id}"
    cidr_block = "10.0.0.0/16"

    tags { 
       Name = "hippogriffin-Subnet"
    }
}

#configure security group
resource "aws_security_group" "hippogriffin-security-group" {
    vpc_id = "${aws_vpc.hippogriffin-vpc.id}"

ingress {
    protocol = -1
    self = true
    from_port = 0
    to_port = 0
}

tags {
    Name = "hippogriffin-Security-Group"
}
}

#configure instance
resource "aws_instance" "hippogriffin-instance" {
   ami = "ami-3548444c"
   instance_type = "t2.micro"

   tags {
       Name = "hippogriffin-Instance"
   }
}