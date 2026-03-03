terraform {
  backend "s3" {
    bucket = "devops-eks-tfstate-744804011934"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
}
