1 - Устанавливаем клиента yc
curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash

2 - делаем конфиг yandex
yc init

3 - выпускаем токен для провайдера
export YC_TOKEN=$(yc iam create-token)

4 - создаем в home папке .terraformrc

provider_installation {
  network_mirror {
    url = "https://terraform-mirror.yandexcloud.net/"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}

5 - terrafom init && terraform plan && terraform apply
