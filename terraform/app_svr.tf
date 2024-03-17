# ---------------------------------------------
# key pair
# ---------------------------------------------
resource "aws_key_pair" "keypair" {
  key_name   = "${var.project}-${var.environment}-keypair"
  public_key = file("${var.key_pair_path}")

  tags = {
    Name    = "${var.project}-${var.environment}-keypair"
    Project = var.project
    Env     = var.environment
  }
}

#---------------------------------------------
# EC2 instance
# ---------------------------------------------
resource "aws_instance" "app_svr_master" {
  ami                         = data.aws_ami.app.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.opmng_sg.id
  ]

  key_name = aws_key_pair.keypair.key_name

  tags = {
    Name    = "${var.project}-${var.environment}-app-ec2-master"
    Project = var.project
    Env     = var.environment
    Type    = "app"
  }
}

resource "aws_instance" "app_svr_ansible1" {
  ami                         = data.aws_ami.app.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.public_subnet_1a.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.opmng_sg.id
  ]

  key_name = aws_key_pair.keypair.key_name

  tags = {
    Name    = "${var.project}-${var.environment}-app-ec2-ansible1"
    Project = var.project
    Env     = var.environment
    Type    = "app"
  }
}

resource "aws_instance" "app_svr_ansible2" {
  ami                         = data.aws_ami.app.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.public_subnet_1c.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.opmng_sg.id
  ]

  key_name = aws_key_pair.keypair.key_name

  tags = {
    Name    = "${var.project}-${var.environment}-app-ec2-ansible2"
    Project = var.project
    Env     = var.environment
    Type    = "app"
  }
}

resource "aws_instance" "app_svr_ansible3" {
  ami                         = data.aws_ami.app.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.private_subnet_1a.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.opmng_sg.id
  ]

  key_name = aws_key_pair.keypair.key_name

  tags = {
    Name    = "${var.project}-${var.environment}-app-ec2-ansible3"
    Project = var.project
    Env     = var.environment
    Type    = "app"
  }
}

resource "aws_instance" "app_svr_ansible4" {
  ami                         = data.aws_ami.app.id
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.private_subnet_1c.id
  associate_public_ip_address = true

  vpc_security_group_ids = [
    aws_security_group.opmng_sg.id
  ]

  key_name = aws_key_pair.keypair.key_name

  tags = {
    Name    = "${var.project}-${var.environment}-app-ec2-ansible4"
    Project = var.project
    Env     = var.environment
    Type    = "app"
  }
}
