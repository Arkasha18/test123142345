resource "yandex_container_registry" "default" {
  name      = "test-registry"
  folder_id = "b1g3d1fn1u6i8bcif09p"

  labels = {
    my-label = "testregistry"
  }
}

