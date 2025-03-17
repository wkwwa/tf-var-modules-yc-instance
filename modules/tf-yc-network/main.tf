data "yandex_vpc_network" "default" {
  name = "default"
}

data "yandex_vpc_subnet" "default" {
  for_each = toset(["ru-central1-a", "ru-central1-b", "ru-central1-c", "ru-central1-d"])

  name = "${data.yandex_vpc_network.default.name}-${each.key}"
}

resource "yandex_vpc_address" "ip_address_public" {
  name = "ip_address_public"

  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}
