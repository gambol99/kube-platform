
## AWS Platform
module "platform" {
  source                   = "git::https://github.com/gambol99/kube-tf-platform.git?ref=master"

  aws_region               = "${var.aws_region}"
  compute_subnets          = "${var.compute_subnets}"
  elb_subnets              = "${var.elb_subnets}"
  environment              = "${var.environment}"
  kms_master_id            = "${var.kms_master_id}"
  mgmt_subnets             = "${var.mgmt_subnets}"
  nat_subnets              = "${var.nat_subnets}"
  private_zone_name        = "${var.private_zone_name}"
  public_zone_name         = "${var.public_zone_name}"
  secrets_bucket_name      = "${var.secrets_bucket_name}"
  secure_subnets           = "${var.secure_subnets}"
  ssh_access_list          = "${var.ssh_access_list}"
  vpc_cidr                 = "${var.vpc_cidr}"
}
