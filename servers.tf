terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}


data "aws_ami" "centos" {
  owners = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"

}

# we have created for each loop
/*variable "" {
  default = "t2.micro"
}*/

data "aws_security_group" "allow-all" {
  name = "allow-all"

}

variable "components" {
  default = {

    frontend= {
  name          = "frontend"
  instance_type = "t2.micro"
}

mongodb= {
  name          = "mongodb"
  instance_type = "t2.micro"
}

catalogue= {
  name          = "catalogue"
  instance_type = "t2.micro"
}

redis= {
  name          = "redis"
  instance_type = "t2.micro"
}
user= {
  name          = "user"
  instance_type = "t2.micro"
}

cart= {
  name          = "cart"
  instance_type = "t2.micro"
}

mysql= {
  name          = "mysql"
  instance_type = "t2.micro"
}

shipping= {
  name          = "shipping"
  instance_type = "t2.micro"
}

rabbitmq= {
  name          = "rabbitmq"
  instance_type = "t2.micro"
}


payment= {
  name          = "payment"
  instance_type = "t2.micro"
}

dispatch= {
  name          = "dispatch"
  instance_type = "t2.micro"
}

}
}




resource "aws_instance" "instance" {

  for_each = var.components
  ami           = data.aws_ami.centos.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = each.value["name"]
  }
}

resource "aws_route53_record" "records" {
  for_each = var.components

  zone_id = "Z05653472ND08OLE086CI"
  name    = "${each.value["name"]}-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}


# we have created for each loop no need of long process


/*

resource "aws_instance" "Frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "Frontend"
  }
}

resource "aws_route53_record" "Frontend" {
  zone_id = "Z05653472ND08OLE086CI"
  name    = "frontend-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.Frontend.private_ip]
}

resource "aws_instance" "MongoDB" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "MongoDB"
  }
}

resource "aws_route53_record" "MongoDB" {
  zone_id = "Z05653472ND08OLE086CI"
  name    = "mongodb-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.MongoDB.private_ip]
}

resource "aws_instance" "Catalogue" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "Catalogue"
  }
}

resource "aws_route53_record" "Catalogue" {
  zone_id = "Z05653472ND08OLE086CI"
  name    = "catalogue-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.Catalogue.private_ip]
}




resource "aws_instance" "Redis" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "Redis"
  }
}

resource "aws_route53_record" "Redis" {
  zone_id = "Z05653472ND08OLE086CI"
  name    = "redis-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.Redis.private_ip]
}

resource "aws_instance" "User" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "User"
  }
}

resource "aws_route53_record" "User" {
  zone_id = "Z05653472ND08OLE086CI"
  name    = "user-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.User.private_ip]
}

resource "aws_instance" "Cart" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "Cart"
  }
}

resource "aws_route53_record" "Cart" {
  zone_id = "Z05653472ND08OLE086CI"
  name    = "cart-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.Cart.private_ip]
}

resource "aws_instance" "MySQL" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "MySQL"
  }
}

resource "aws_route53_record" "MySQL" {
  zone_id = "Z05653472ND08OLE086CI"
  name    = "mysql-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.Frontend.private_ip]
}

resource "aws_instance" "Shipping" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "Shipping"
  }
}

resource "aws_route53_record" "Shipping" {
  zone_id = "Z05653472ND08OLE086CI"
  name    = "shipping-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.Shipping.private_ip]
}

resource "aws_instance" "RabbitMQ" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "RabbitMQ"
  }
}

resource "aws_route53_record" "RabbitMQ" {
  zone_id = "Z05653472ND08OLE086CI"
  name    = "rabbitmq-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.RabbitMQ.private_ip]
}

resource "aws_instance" "Payment" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "Payment"
  }
}

resource "aws_route53_record" "Payment" {
  zone_id = "Z05653472ND08OLE086CI"
  name    = "payment-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.Payment.private_ip]
}

resource "aws_instance" "Dispatch" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.allow-all.id]
  tags = {
    Name = "Dispatch"
  }
}

resource "aws_route53_record" "Dispatch" {
  zone_id = "Z05653472ND08OLE086CI"
  name    = "dispatch-dev.sseedarla.site"
  type    = "A"
  ttl     = 30
  records = [aws_instance.Dispatch.private_ip]
}



 */

