provider "yandex" {
  
  token     = var.token

  cloud_id  = var.instance_cloud
  folder_id = var.instance_folder
  zone      = var.instance_zone
}
