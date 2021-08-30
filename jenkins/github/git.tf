variable "repo_name" {}
variable "token" {}
variable "ipdata" {}




#Uploading Content to Github
resource "github_repository_file" "file" {
  repository          = var.repo_name
  branch              = "main"
  file                = "ip.txt"
  content             = var.ipdata
  commit_message      = "Ansible Inventory file updated"
  commit_author       = "visheshgarg"
  commit_email        = "vishesh8199@gmail.com"
  overwrite_on_create = true
}
