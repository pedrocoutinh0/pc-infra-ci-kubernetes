terraform {
  backend "s3" {
    bucket = "terraform-state-alura"
    key    = "Prod/terraform.tfstate"
    region = "sa-east-1"
  }
}