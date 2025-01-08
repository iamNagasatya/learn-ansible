variable "instances" {
  description = "Map of EC2 instances"
  type = map(object({
    ami           = string
    instance_type = string
    default_username = string
    tags          = map(string)
  }))
  default = {
    "Amazon Linux 2023" = {
      ami           = "ami-01816d07b1128cd2d"
      instance_type = "t2.micro"
      default_username = "ec2-user"

      tags = {
        Name = "Amazon Linux 2023"
      }
    },
    "Red Hat Enterprise Linux version 9" = {
      ami           = "ami-0c7af5fe939f2677f"
      instance_type = "t2.micro"
      default_username = "ec2-user"

      tags = {
        Name = "Red Hat Enterprise Linux version 9"
      }
    },
    "Ubuntu Server 24.04 LTS" = {
      ami           = "ami-0e2c8caa4b6378d8c"
      instance_type = "t2.micro"
      default_username = "ubuntu"

      tags = {
        Name = "Ubuntu Server 24.04 LTS"
      }
    }
  }
}
