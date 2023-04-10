# Terraform Playground

Just playing around with terraform and AWS

## Prerequisites

- Terraform cli v1.3.3+
- An AWS account and the [aws-cli](https://aws.amazon.com/cli/) configured

## Usage

- Clone this repository: `git clone https://github.com/cristianoliveira/tf-playground.git`
- Change into the project directory: `cd tf-playground`
- Initialize Terraform: `terraform init`
- Configure your variables in `cp dev.tfvars.example dev.tfvars` and edit the file.
- Create an execution plan: `terraform plan -var-file="dev.tfvars"`
- Apply the execution plan: `terraform apply -var-file="dev.tfvars"`

If you want to delete everything: `terraform destroy`
