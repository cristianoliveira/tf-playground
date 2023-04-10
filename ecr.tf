resource "aws_ecr_repository" "ecr_repo" {
    name = "${var.aws_ecr_repo_name}"
}
