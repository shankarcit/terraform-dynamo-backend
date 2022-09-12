terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.27"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-northeast-1"
}

resource "aws_dynamodb_table" "terraform-lock-tb" {
    name           = "tbl_state_lock_abc_demo"
    read_capacity  = 2
    write_capacity = 2
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "paidy-demo-temp"
    }
}