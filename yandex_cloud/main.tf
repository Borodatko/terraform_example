resource "yandex_compute_image" "deb" {
  name = "debian"
  family = "debian-11"
}

resource "yandex_compute_instance" "test" {
  name = "test"

  resources {
    cores = 4
    memory = 8
  }

  boot_disk {
    initialize_params {
      image_id = "${yandex_compute_image.deb.id}"
      size = "10"
      type = "network-nvme"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.internal.id}"
    nat = true
  }
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id = "${var.yandex_cloud_id}"
  folder_id = "${var.yandex_folder_id}"
  zone = "ru-central1-a"
}
