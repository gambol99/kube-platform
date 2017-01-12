
## Bastion Cluster
module "bastion" {
  source                     = "git::https://github.com/gambol99/kube-tf-bastion.git?ref=master"

  bastion_image              = "${var.coreos_image}"
  bastion_image_owner        = "${var.coreos_image_owner}"
  environment                = "${var.environment}"
  kms_master_id              = "${var.kms_master_id}"
  kubernetes_image           = "${var.kubernetes_image}"
  private_zone_name          = "${var.private_zone_name}"
  public_zone_name           = "${var.public_zone_name}"
  secrets_bucket_name        = "${var.secrets_bucket_name}"

  aws_region                 = "${var.aws_region}"
  bastion_subnets            = "${module.platform.mgmt_subnets}"
  bastion_sg                 = "${module.platform.mgmt_sg}"
  key_name                   = "${module.platform.key_name}"
  vpc_id                     = "${module.platform.vpc_id}"
}
