
terraform {
  backend "local" {
    path = "./registry_state.tfstate"
  }
}
