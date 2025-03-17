## Provider Yandex.Cloud:
```
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
required_version = ">= 0.13"
}
```
## Input Variables:
```
variable "image_id" {
  description = "instance operating system"
  type        = string
  default     = "fd80qm01ah03dkqb14lc"
}
variable "instance_zone" {
  description = "instance default zone"
  type        = string
  default     = "ru-central1-a"
}
variable "instance_cores" {
  description = "instance core resources"
  type        = number
  default     = 2
}
variable "instance_memory" {
  description = "instance memory resources"
  type        = number
  default     = 2
}
variable "instance_disk_size" {
  description = "instance disk size resources"
  type        = number
  default     = 30
}
```

## Module Output: 
```
output "ip_address" {
    value = module.tf-yc-instance.ip_address_internal
}
output "ip_address_public" {
    value = module.tf-yc-instance.ip_address_public
}
```


