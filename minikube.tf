module "minikube" {
  source = "github.com/scholzj/terraform-aws-minikube"

  aws_region        = "us-east-1"
  cluster_name      = "roboshop"
  aws_instance_type = "t3.medium"
  #ssh_public_key    = "~/.ssh/kubernetes.pub"   
  ssh_public_key = var.key_location
  aws_subnet_id = "subnet-033975e4a5d8239d3" # replace with yours
  # by default centos 7 will be used
  #ami_image_id = "ami-b81dbfc5"
  hosted_zone         = "reedauniverse.online"
  hosted_zone_private = false

  tags = {
    Application = "Minikube"
  }

  addons = [
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
    "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
  ]
}

variable "key_location" {
  default = "C:\\Users\\Rock Star\\.ssh\\kubernetes.pub"
}