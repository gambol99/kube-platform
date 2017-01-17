## Generic Inputs
variable "environment" {
  description = "The environment i.e. dev, prod, stage etc"
}
variable "public_zone_name" {
  description = "The route53 domain associated to the environment"
}
variable "private_zone_name" {
  description = "The internal private domain for the environment"
}
variable "kms_master_id" {
  description = "The AWS KMS id this environment is using"
}
variable "secrets_bucket_name" {
  description = "The name of the s3 bucket which is holding the secrets"
}
variable "coreos_image" {
  description = "The CoreOS image AMI to use for the nodes"
  default     = "CoreOS-beta-1247.2.0-hvm"
}
variable "coreos_image_owner" {
  description = "The owner of the AMI to use, used by the filter"
  default     = "595879546273"
}

## KUBERNETES ##
variable "kubernetes_image" {
  description = "The docker kubernetes image we are using"
  default     = "quay.io/coreos/hyperkube:v1.5.2_coreos.0"
}
variable "kubeapi_internal_dns" {
  description = "The dns name of the internal kubernetes api elb"
}
variable "kubeapi_dns" {
  description = "The dns / hostname of the external kubernetes api"
}
variable "enable_calico" {
  description = "Whether to enable the calico network security policy"
  default     = false
}
variable "compute_labels" {
  description = "A map of labels to be applied to the compute nodes"
  default     = {
    "role" = "compute"
  }
}

## AWS PROVIDER ##
variable "aws_region" {
  description = "The AWS Region we are building the cluster in"
}

## AWS NETWORKING
variable "vpc_cidr" {
  description = "The CIDR of the VPC for this environment"
  default     = "10.100.0.0/16"
}
variable "ssh_access_list" {
  description = "A comma separated list of ip addresses to permit external ssh access"
  default     = []
}
variable "kubeapi_access_list" {
  description = "A comma separated list of ip addresses to permit external kubeapi access"
  default     = []
}
variable "kubeapi_external_elb" {
  description = "Indicates if we should have an external kubernetes api"
  default     = true
}
variable "secure_subnets" {
  description = "The secure subnets and the zone's they occupy"
  type        = "map"
  default = {
    "az0_cidr"  = "10.100.10.0/24"
    "az1_cidr"  = "10.100.11.0/24"
    "az2_cidr"  = "10.100.12.0/24"
    "az0_zone"  = "eu-west-1a"
    "az1_zone"  = "eu-west-1b"
    "az2_zone"  = "eu-west-1c"
  }
}
variable "compute_subnets" {
  description = "The compute subnets and the zone's they occupy"
  type        = "map"
  default = {
    "az0_cidr"  = "10.100.20.0/24"
    "az1_cidr"  = "10.100.21.0/24"
    "az2_cidr"  = "10.100.22.0/24"
    "az0_zone"  = "eu-west-1a"
    "az1_zone"  = "eu-west-1b"
    "az2_zone"  = "eu-west-1c"
  }
}
variable "elb_subnets" {
  description = "The ELB subnets and the zone's they occupy"
  type        = "map"
  default = {
    "az0_cidr"  = "10.100.30.0/24"
    "az1_cidr"  = "10.100.31.0/24"
    "az2_cidr"  = "10.100.32.0/24"
    "az0_zone"  = "eu-west-1a"
    "az1_zone"  = "eu-west-1b"
    "az2_zone"  = "eu-west-1c"
  }
}
variable "nat_subnets" {
  description = "The nat subnets and the zone's they occupy"
  type        = "map"
  default = {
    "az0_cidr"  = "10.100.90.0/24"
    "az1_cidr"  = "10.100.91.0/24"
    "az2_cidr"  = "10.100.92.0/24"
    "az0_zone"  = "eu-west-1a"
    "az1_zone"  = "eu-west-1b"
    "az2_zone"  = "eu-west-1c"
  }
}
variable "mgmt_subnets" {
  description = "The management subnets and the zone's they occupy"
  type        = "map"
  default = {
    "az0_cidr"  = "10.100.100.0/24"
    "az1_cidr"  = "10.100.101.0/24"
    "az2_cidr"  = "10.100.102.0/24"
    "az0_zone"  = "eu-west-1a"
    "az1_zone"  = "eu-west-1b"
    "az2_zone"  = "eu-west-1c"
  }
}

#
## OVERLAY NETWORK ##
#
variable "flannel_cidr" {
  description = "The flannel overlay network cidr"
  default     = "10.10.0.0/16"
}

#
## COMPUTE RELATED ##
#
variable "compute_flavor" {
  description = "The AWS instance type to use for the compute nodes"
  default     = "t2.small"
}
variable "compute_asg_grace_period" {
  description = "The grace period between rebuild in the compute auto-scaling group"
  default     = "10"
}
variable "compute_asg_max" {
  description = "The maximum number of machines in the compute auto-scaling group"
  default     = "100"
}
variable "compute_asg_min" {
  description = "The minimum number of machines in the compute auto-scaling group"
  default     = "3"
}
variable "compute_root_volume" {
  description = "The partition size of the docker partition for the compute nodes"
  default     = "32"
}
variable "compute_docker_volume_type" {
  description = "The /var/lib/docker partition for the compute node ebs type"
  default     = "standard"
}
variable "compute_docker_volume" {
  description = "The size of the /var/lib/docker partition for the compute nodes"
  default     = "24"
}

#
## SECURE LAYER RELATED ##
#
variable "secure_flavor" {
  description = "The AWS instance type to use for the secure nodes"
  default     = "t2.small"
}
variable "secure_asg_max" {
  description = "The maximum amount of nodes in the secure auto-scaling cluster"
  default     = 4
}
variable "secure_asg_min" {
  description = "The minimum amount of nodes in the secure auto-scaling group, should be at least 5 for dynamic updates to work"
  default     = 3
}
variable "secure_root_volume" {
  description = "The size of the root partition of a secure node"
  default     = 24
}
variable "secure_data_volume" {
  description = "The size of the etcd data partition of a secure node"
  default     = 32
}
variable "secure_data_encrypted" {
  description = "Indicates if the data volume for etcd should be encrypted"
  default     = false
}
variable "secure_docker_volume" {
  description = "The size in gigabytes for the docker volume partition"
  default     = 32
}
variable "secure_data_volume_type" {
  description = "The volume type for the etcd data volume"
  default     = "standard"
}
variable "secure_asg_grace_period" {
  description = "The grace period between rebuild in the secure auto-scaling group"
  default     = 10
}
variable "secure_nodes" {
  description = "A map of all the secure nodes and their static ip addresses"
  default     = {
    "node0" = "10.100.10.100"
    "node1" = "10.100.11.100"
    "node2" = "10.100.12.100"
  }
}
variable "secure_nodes_zones" {
  description = "A map containing the secure nodes and the availability zone they reside"
  default = {
    "node1_zone" = "eu-west-1a"
    "node2_zone" = "eu-west-1b"
    "node3_zone" = "eu-west-1c"
  }
}
variable "secure_nodes_asg" {
  description = "The size of each of the asg in the availability zones"
  default     = {
    "zone0_size" = 1
    "zone1_size" = 1
    "zone2_size" = 1
    "zone0_zone" = "eu-west-1a"
    "zone1_zone" = "eu-west-1b"
    "zone2_zone" = "eu-west-1c"
  }
}
