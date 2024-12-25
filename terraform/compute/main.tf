module "compute" {
  source            = "../modules/yandex-compute-instance"
  folder_id         = var.folder_id
  compute_instances = local.compute
}