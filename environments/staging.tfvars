#
# Development Environment
#
environment              = "staging"
kms_master_id            = "NEEDS_ADDING"
kubeapi_dns              = "kube-staging"
kubeapi_internal_dns     = "kube"
private_zone_name        = "NEEDS_ADDING"
public_zone_name         = "NEEDS_ADDING"
secrets_bucket_name      = "staging-dsp-io-secrets-eu-west-1"
secure_flavor            = "t2.medium"
terraform_bucket_name    = "kube-platform-terraform-state-eu-west-1"
vpc_cidr                 = "10.80.0.0/16"

kubeapi_access_list = [
  "0.0.0.0/0"
]
ssh_access_list = [
  "0.0.0.0/0"
]

nat_subnets = {
  "az0_cidr"  = "10.80.0.0/24"
  "az1_cidr"  = "10.80.1.0/24"
  "az2_cidr"  = "10.80.2.0/24"
  "az0_zone"  = "eu-west-1a"
  "az1_zone"  = "eu-west-1b"
  "az2_zone"  = "eu-west-1c"
}
compute_subnets = {
  "az0_cidr"  = "10.80.20.0/24"
  "az1_cidr"  = "10.80.21.0/24"
  "az2_cidr"  = "10.80.22.0/24"
  "az0_zone"  = "eu-west-1a"
  "az1_zone"  = "eu-west-1b"
  "az2_zone"  = "eu-west-1c"
}
secure_subnets = {
  "az0_cidr"  = "10.80.10.0/24"
  "az1_cidr"  = "10.80.11.0/24"
  "az2_cidr"  = "10.80.12.0/24"
  "az0_zone"  = "eu-west-1a"
  "az1_zone"  = "eu-west-1b"
  "az2_zone"  = "eu-west-1c"
}
elb_subnets = {
  "az0_cidr"  = "10.80.100.0/24"
  "az1_cidr"  = "10.80.101.0/24"
  "az2_cidr"  = "10.80.102.0/24"
  "az0_zone"  = "eu-west-1a"
  "az1_zone"  = "eu-west-1b"
  "az2_zone"  = "eu-west-1c"
}
mgmt_subnets = {
  "az0_cidr"  = "10.80.110.0/24"
  "az1_cidr"  = "10.80.111.0/24"
  "az2_cidr"  = "10.80.112.0/24"
  "az0_zone"  = "eu-west-1a"
  "az1_zone"  = "eu-west-1b"
  "az2_zone"  = "eu-west-1c"
}

secure_nodes = {
  "node0" = "10.80.10.100"
  "node1" = "10.80.11.100"
  "node2" = "10.80.12.100"
}
secure_nodes_zones {
  "node0_zone" = "eu-west-1a"
  "node1_zone" = "eu-west-1b"
  "node2_zone" = "eu-west-1c"
}
secure_nodes_asg = {
  "zone0_size" = 1
  "zone1_size" = 1
  "zone2_size" = 1
  "zone0_zone" = "eu-west-1a"
  "zone1_zone" = "eu-west-1b"
  "zone2_zone" = "eu-west-1c"
}
