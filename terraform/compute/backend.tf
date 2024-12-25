terraform {
  backend "local" {
    path = "./vm_state.tfstate"
  }
}
