#!/usr/bin/env bash
set -e

# aws configure --profile personal
#
echo "Configuring ECR to upload images"

AWS_ECR_REPO_NAME=${AWS_ECR_REPO}
AWS_REGION=${REGION:-eu-west-1}
IMG_TAG="${IMAGE_TAG:-latest}"

ACCOUNT_ID=$(aws sts get-caller-identity --profile personal | jq -r ".Account")
AWS_ECR_REGISTRY_URL="$ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$AWS_ECR_REPO_NAME"
ECR_IMAGE_URL="$AWS_ECR_REGISTRY_URL:$IMG_TAG"

docker tag "$IMG_TAG" "$ECR_IMAGE_URL"

echo "$ECR_IMAGE_URL"

echo "LOGIN"

aws ecr get-login-password --region eu-west-1 --profile personal | docker login --username AWS --password-stdin "$AWS_ECR_REGISTRY_URL"

echo "Success"

echo "Pushing..."

docker push "$ECR_IMAGE_URL"
