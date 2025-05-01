module "jenkins_iam" {
  source = "./module/iam_roles"
  instance_profile_name = "jenkins-instance-profile"
  iam_policy_name       = "jenkins-iam-policy"
  role_name             = "jenkins-role"
}

module "ALB" {
  source        = "./module/alb"
  subnets       = [var.subnet-1, var.subnet-2, var.subnet-3]
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_id        = var.vpc_id
  environment   = var.environment
}

module "EFS" {
  source = "./module/EFS"
  vpc_id     = var.vpc_id
  subnet_ids = [var.subnet-1, var.subnet-2, var.subnet-3]
}

module "EC2_instance" {
  source = "./module/EC2"
  instance_name      = "jenkins-agent"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_ids         = [var.subnet-1, var.subnet-2, var.subnet-3]
  instance_count     = 1
}