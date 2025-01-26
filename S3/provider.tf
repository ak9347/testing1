terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

backend "s3"{
    bucket = "my-bucket-d779c71"
    key = "state"
    region = "us-east-1"
    dynamodb_table = "Practice"
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}