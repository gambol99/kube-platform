
## Outputs
output "kubeapi_public"        { value = "${module.api.kubeapi_dns}" }
output "kubeapi_public_elb"    { value = "${module.api.kubeapi_dns_aws}"}
output "enabled_calico"        { value = "${var.enable_calico}" }
output "public_name_services"  { value = [ "${module.platform.public_nameservers}" ] }
