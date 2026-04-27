terraform {
  required_version = "~>1.14.9"

  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.42"
    }
  }
}

provider "aws" {
    profile = "tf-user-personal-account"
    region = "us-east-1"
}

resource "aws_iam_user" "name" {
    count = 3
    name = "aws_iam_user-${count.index}"
}

output "output_arns" {
    # value = aws_iam_user.name[0].arn
    # value = aws_iam_user.name[1].arn
    # value = aws_iam_user.name[2].arn
    # You can define above also like this for getting the arn in the output when u do terraform apply, but using splat[*], it will print all the arns at once
    value = aws_iam_user.name[*].arn
}