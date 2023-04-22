

resource "aws_instance" "demo1" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.route_sg.id]
  subnet_id = module.vpc.public_subnets[0]
  key_name      = "dev-wdp"
  user_data     = file("${path.module}/route53.sh")
  associate_public_ip_address = true
  tags = {
    "Name" = var.instance-name
    "env"  = var.env
    "Team" = var.team
  }
}
variable "team" {
    default = "dev Team"
  
}
 
