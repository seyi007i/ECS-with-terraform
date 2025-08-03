resource "aws_key_pair" "deployer" {
  key_name    = "terraformkubectl"
  public_key = file("~/.ssh/terraform.pub") 
}