terraform {
  backend "s3" {
    bucket = "terraform-state-eks-pedro"
    key    = "Prod/terraform.tfstate"
    region = "sa-east-1"
  }
}