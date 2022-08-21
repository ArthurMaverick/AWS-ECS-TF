resource "aws_instance" "instance" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  network_interface {
    network_interface_id = var.network_interface_id
    device_index         = 0
  }

  key_name = var.key_name
  subnet_id = var.subnet_id

  ebs_block_device {
    device_name = var.ebs_block_device.device_name
    volume_size = var.ebs_block_device.volume_size
  }
  
  credit_specification {
    cpu_credits = "unlimited"
  }

    tags = {
    Environment = var.environment
  }

}