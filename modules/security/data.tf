# Obtain the public IP address of the local device
data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
}