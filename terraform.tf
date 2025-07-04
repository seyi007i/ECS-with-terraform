terraform {
  
  required_version = ">= 1.0.0"
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }

  backend "s3" {
    bucket         = "tf-backend-bucket-26042025"
    key            = "tf_state"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }

}