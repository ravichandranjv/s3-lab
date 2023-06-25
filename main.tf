terraform {
    required_version = ">= 0.12.7"
    required_providers {
        aws = {
        source = "hashicorp/aws"
        }
    }
}

provider "aws" {
    profile = "default"
    region = "${var.region}"
}


resource "aws_s3_bucket" "example" {
  bucket = "tf-lab-1-bucket"
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.example.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["${var.account}"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.example.arn,
      "${aws_s3_bucket.example.arn}/*",
    ]
  }
}