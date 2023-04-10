# Terraform Playground

Just playing around with terraform and AWS

## Prerequisites

- Terraform cli v1.3.3+
- An AWS account and the [aws-cli](https://aws.amazon.com/cli/) configured

## Usage

### AWS cli

- Configure a new profile for aws-cli
- `aws login`
- `aws configure --profile personal`

### Terraform infra

- Clone this repository: `git clone https://github.com/cristianoliveira/tf-playground.git`
- Change into the project directory: `cd tf-playground`
- Initialize Terraform: `terraform init`
- Configure your variables in `cp dev.tfvars.example dev.tfvars` and edit the file.
- Create an execution plan: `terraform plan -var-file="dev.tfvars"`
- Apply the execution plan: `terraform apply -var-file="dev.tfvars"`

If you want to delete everything: `terraform destroy`

## Deploying the app

- Create a new image by running `docker build app -t app-v0.0.1`
- Push the new created image to ECR by running:
  `AWS_ECR_REPO=your_ecr IMAGE_TAG=app-v0.0.1 ./aws-push-image-to-ecr.sh`
- Update the image tag (app_image_tag) in `./dev.tfvars`
- Apply the new state: `terraform apply -var-file="dev.tfvars"`
