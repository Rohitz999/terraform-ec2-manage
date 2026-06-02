terraform {
  backend "s3" {
    bucket = "tom-c1dxoys7"
    key    = "uat/ec2/terraform.tfstate"
    region = "eu-central-1"
  }
}