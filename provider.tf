provider "aws" {
  region  = "${var.aws_region}"
  profile = "${var.aws_profile}" # configured with `aws configure --profile <val>`
}
