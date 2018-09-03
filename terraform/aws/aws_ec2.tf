#configure provider
provider "aws" {
    shared_credentials_file = "$HOME/.aws/credentials/aws-secret"
    region = "${var.region}"
}

#configure instance
resource "aws_instance" "${var.wordpress_instance_name}" {
   ami = "${var.ami}"
   instance_type = "${var.instance_type}"

   tags {
       Name = "${var.wordpress_instance_name}"
   }
}

#configure instance
resource "aws_instance" "${var.db_instance_name}" {
   ami = "${var.ami}"
   instance_type = "${var.instance_type}"

   tags {
       Name = "${var.db_instance_name}"
   }
}

#configure instance
resource "aws_instance" "${var.proxy_instance_name}" {
   ami = "${var.ami}"
   instance_type = "${var.instance_type}"

   tags {
       Name = "${var.proxy_instance_name}"
   }
}

#configure instance
resource "aws_instance" "${var.jumpbox_instance_name}" {
   ami = "${var.ami}"
   instance_type = "${var.instance_type}"

   tags {
       Name = "${var.jumpbox_instance_name}"
   }
}

#configure instance
resource "aws_instance" "${var.jenkins_instance_name}" {
   ami = "${var.ami}"
   instance_type = "${var.instance_type}"

   tags {
       Name = "${var.jenkins_instance_name}"
   }
}