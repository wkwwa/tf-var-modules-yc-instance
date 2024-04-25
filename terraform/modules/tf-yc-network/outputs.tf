# output "ip_address" {
#  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
# }  
# output "global_ip_address" {
# value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
# }

output "yandex_vpc_subnets" {
  description = "Yandex.Cloud Subnets map"
  value       = data.yandex_vpc_subnet.default
}
