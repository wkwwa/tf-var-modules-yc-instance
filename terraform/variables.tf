#=========== main ==============
variable "instance_cloud" {
  description = "instance cloud ID"
  type        = string
}
variable "instance_folder" {
  description = "instance folder ID"
  type        = string
}
variable "instance_zone" {
  description = "instance default zone"
  type        = string
  default     = "ru-central1-a"
}
