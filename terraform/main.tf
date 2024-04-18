terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  #Описание бэкенда хранения состояния
  backend "s3" {
    endpoint = "storage.yandexcloud.net"
    bucket   = "terraform-state-std-ext-006-10"
    region   = "ru-central1"
    key      = "terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

provider "yandex" {
  cloud_id  = "b1g3jddf4nv5e9okle7p"
  folder_id = "b1gmkburmg469kko92tq"
  zone      = "ru-central1-a"
}

# data "template_file" "user_data" {
#  template = file("../scripts/add-ssh-web-app.yaml")
#}

resource "yandex_compute_instance" "vm-1" {
  name = "chapter7-lesson2-std-006-10"

  # Конфигурация ресурсов:
  # количество процессоров и оперативной памяти
  resources {
    cores  = 2
    memory = 2
  }

  # Загрузочный диск:
  # здесь указывается образ операционной системы
  # для новой виртуальной машины
  boot_disk {
    initialize_params {
      image_id = "fd80qm01ah03dkqb14lc"
    }
  }

  # Сетевой интерфейс:
  # нужно указать идентификатор подсети, к которой будет подключена ВМ
  network_interface {
    subnet_id = "e9bfsi41ajqfhjbbmulg"
    nat       = false
  }

  # Метаданные машины:
  # здесь можно указать скрипт, который запустится при создании ВМ
  # или список SSH-ключей для доступа на ВМ
  metadata = {
    user-data = "${file("../terraform/scripts//meta.txt")}"

    # ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }

}

output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
