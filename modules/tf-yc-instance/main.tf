resource "yandex_compute_instance" "vm-1" {
  name = "chapter7-practice1-std-006-10" 
  platform_id = var.platform_id
  zone = var.instance_zone

# Конфигурация ресурсов:
  # количество процессоров и оперативной памяти
  resources {
    cores  = var.instance_cores
    memory = var.instance_memory
  }
  scheduling_policy {
    preemptible = true
    }

  # Загрузочный диск:
  # здесь указывается образ операционной системы
  # для новой виртуальной машины
  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = var.instance_disk_size
      }
  }

 network_interface {
    subnet_id = "e2lgbprrdei1u1ute7pa"
    nat       = true
   # nat_ip_address = module.tf-yc-network.yandex_vpc_address.ip_address_public.external_ipv4_address.0.address
  }

  metadata = {
    # ssh-keys = ansible:${file("~/.ssh/id_rsa.pub")}"
    user-data = "${file("../terraform/meta.txt")}"
  }
}
