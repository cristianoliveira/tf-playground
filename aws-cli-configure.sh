# aws configure --profile personal
#
echo "Configuring ECR to upload images"

IMG_TAG="${IMAGE_TAG:-latest}"
ECR_IMAGE_URL="$AWS_ECR_REGISTRY_URL:$IMG_TAG"

docker tag "$IMAGE:$IMG_TAG" "$ECR_IMAGE_URL"

aws ecr get-login-password --region "$AWS_REGION" --profile personal | docker login --username AWS --password-stdin "$AWS_ECR_REGISTRY_URL"

docker push "$ECR_IMAGE_URL"
