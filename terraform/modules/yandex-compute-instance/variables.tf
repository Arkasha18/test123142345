variable "compute_instances" {
  type = map(object({
    name                      = string
    description               = optional(string)
    labels                    = optional(map(string))
    zone                      = optional(string)
    hostname                  = optional(string)
    platform_id               = optional(string)
    metadata                  = optional(any)
    service_account_id        = optional(string)
    allow_stopping_for_update = optional(bool)
    network_interfaces        = list(object({
      subnet_id          = string
      ip_address         = optional(string)
      nat                = optional(bool)
      nat_ip_address     = optional(string)
      security_group_ids = optional(list(string))
    }))
    resources = object({
      cores         = number
      memory        = number
      core_fraction = optional(number)
    })
    boot_disk = object({
      auto_delete = optional(bool)
      device_name = optional(string)
      mode        = optional(string)
    })
    initialize_params = object({
      name        = optional(string)
      description = optional(string)
      size        = optional(number)
      type        = optional(string)
      image_id    = optional(string)
      snapshot_id = optional(string)
    })
  }))
}

variable "folder_id" {
  type = string
}
