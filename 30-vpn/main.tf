resource "aws_key_pair" "OpenVPN" {
  key_name   = "openvpn"
  public_key = file("C:\\Users\\sriam\\devops\\daws-84s\\openvpn.pub")
}

resource "aws_instance" "vpn" {
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.vpn_sg_id]
  subnet_id = local.public_subnet_ids
  key_name = aws_key_pair.OpenVPN.key_name  
 #key_name = "daws-84" #make sure this key exist in aws
  user_data = file("openvpn.sh") 

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-vpn"
    }
  )
  
}

