resource "yandex_compute_instance" "compute-instance" {
  for_each                  = var.compute_instances
  folder_id                 = var.folder_id
  name                      = each.value["name"]
  platform_id               = each.value["platform_id"]
  zone                      = each.value["zone"]
  service_account_id        = each.value["service_account_id"]
  allow_stopping_for_update = each.value["allow_stopping_for_update"]
  labels                    = each.value["labels"]
  boot_disk {
    auto_delete = each.value["boot_disk"]["auto_delete"]
    device_name = each.value["boot_disk"]["device_name"]
    mode        = each.value["boot_disk"]["mode"]
    initialize_params {
      image_id = each.value["initialize_params"]["image_id"]
      name     = each.value["initialize_params"]["name"]
      type     = each.value["initialize_params"]["type"]
      size     = each.value["initialize_params"]["size"]
    }
  }

  dynamic "network_interface" {
    for_each = each.value["network_interfaces"]
    content {
      subnet_id          = network_interface.value["subnet_id"]
      ip_address         = network_interface.value["ip_address"]
      nat                = network_interface.value["nat"]
      nat_ip_address     = network_interface.value["nat_ip_address"]
      security_group_ids = network_interface.value["security_group_ids"]
    }
  }

  resources {
    cores         = each.value["resources"]["cores"]
    memory        = each.value["resources"]["memory"]
    core_fraction = each.value["resources"]["core_fraction"]
  }
  metadata = {
    user-data = each.value["metadata"]
  }
  lifecycle {
    ignore_changes = [metadata]
  }
}
