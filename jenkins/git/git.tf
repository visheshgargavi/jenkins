provider "github" {
  token        = "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"
  organization = "visheshgargavi"
}

resource "github_repository" "jenkins-repo" {
  name        = "jenkins-repo"
  description = "My new repository for use with Terraform"
  auto_init = true
  visibility  = "public"
}

resource "github_repository_file" "foo" {
  repository          = github_repository.foo.name
  branch              = "main"
  file                = ".gitignore"
  content             = "**/*.tfstate"
  commit_message      = "Managed by Terraform"
  commit_author       = "visheshgargavi"
  commit_email        = "vishesh8199@gmail.com"
  overwrite_on_create = true
}