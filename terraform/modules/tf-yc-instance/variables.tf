#=========== main ==============
variable "platform_id" {
  description = "instance platform ID"
  type        = string
  default     = "standard-v1"
}
variable "image_id" {
  description = "instance operating system"
  type        = string
  default     = "fd80qm01ah03dkqb14lc"
}
variable "instance_zone" {
  description = "instance default zone"
  type        = string
  default     = "ru-central1-b"
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
