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


variable "instance_type" {
  default = "t2.micro"
}

data "aws_security_groups" "allow-all" {
  name = "Allow-all"

}



resource "aws_instance" "Frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_groups.allow-all.id]
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
  vpc_security_group_ids = [data.aws_security_groups.allow-all.id]
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
  vpc_security_group_ids = [data.aws_security_groups.allow-all.id]
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
  vpc_security_group_ids = [data.aws_security_groups.allow-all.id]
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
  vpc_security_group_ids = [data.aws_security_groups.allow-all.id]
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
  vpc_security_group_ids = [data.aws_security_groups.allow-all.id]
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
  vpc_security_group_ids = [data.aws_security_groups.allow-all.id]
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
  vpc_security_group_ids = [data.aws_security_groups.allow-all.id]
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
  vpc_security_group_ids = [data.aws_security_groups.allow-all.id]
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
  vpc_security_group_ids = [data.aws_security_groups.allow-all.id]
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
  vpc_security_group_ids = [data.aws_security_groups.allow-all.id]
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


