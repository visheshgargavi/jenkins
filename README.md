# Terraform
1. Creating ec2-instance on the top of Aws , using terraform.
2. Storing the public-ip locally into a new file using Null Resource and local-exec.
3. Uploading the ip.txt file to the github in the specified repo.

# Jenkins
1. Github will trigger the jenkins and jenkins will start running the pipeline.

# Kubernetes
1. Jenkins will run the k8s.yml which will setup a multi Node cluster(master-slave architecture) on the top of cloud and creating a k8s pod using a pre created image which will live our website on specific port.
