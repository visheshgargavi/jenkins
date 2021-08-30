provider "github" {
  token = var.token
}

module "ec2" {
     source = "./ec2"
}

module "git" {
     depends_on = [
          module.ec2
     ]
     source = "./github"
     #repo_url = var.repo_url
     repo_name = var.repo_name
     ipdata = module.ec2.ip_data
     token=var.token
}
