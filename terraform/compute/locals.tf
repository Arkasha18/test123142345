locals {

  compute = {
    tests = {
      name                      = "tests"
      platform_id               = "standard-v2"
      #zone = "${data.terraform_remote_state.subnets.outputs.vpc_subnets["nat-b"]["zone"]}"
      #hardcore for quik
      zone = "ru-central1-b"
      allow_stopping_for_update = false
      network_interfaces = [
        {
          #subnet_id      = "${data.terraform_remote_state.subnets.outputs.vpc_subnets["nat-b"]["id"]}"
          #hardcore for quik
          subnet_id      = "e2l0umn039lbrbf9999f"
          #hardcore нет доступа
          #nat_ip_address = "1.1.1.1"
          security_group_ids = []
        }
      ]
      resources = {
        cores         = 2
        memory        = 2
        core_fraction = 50
      }
      initialize_params = {
        size     = 15
        type     = "network-hdd"
        image_id = "fd8f214vjg7im9ugd4ns" # For docker
      }
      boot_disk = {
        auto_delete = true
      }
      metadata = file("./data/cloud-init/instance.yaml")
    }
  }
}