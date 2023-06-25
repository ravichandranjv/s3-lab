variable "region" {
    default = "ap-south-1"
    description = "AWS Region to deploy to"
}

variable "common-name-value" {
    default = "s3-lab-1-"
    description = "Common naming convention for all Terraform created resources"
}

variable "account"{
    default = "069623884547"
}

variable "destinationbucketname"{
    default = "destination"
}

variable "environment"{
    default = "dev"
}

