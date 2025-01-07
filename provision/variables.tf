variable "ami_ids" {
  type = map(string)
  description = "ami ids"
  default = {
    "Amazon Linux 2023" = "ami-01816d07b1128cd2d"
    "Red Hat Enterprise Linux version 9" = "ami-0c7af5fe939f2677f"
    "Ubuntu Server 24.04 LTS" = "ami-0e2c8caa4b6378d8c"
  }
}