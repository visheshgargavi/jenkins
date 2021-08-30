variable "token" {
  type = string
  default = "<your pat>"
  description = "Token for authentication"
}

variable "repo_name" {
  type = string
  default = "Ansible-Internship-Project"
  description = "Repository Name of Github"
}

variable "repo_url" {
  type = string
  default = "https://<user>:<pass>@github.com/visheshgargavi/jenkins"
  description = "Repository Url"
}
