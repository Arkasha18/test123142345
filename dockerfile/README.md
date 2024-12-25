0 - подготовить окружение yc init & yc container registry configure-docker
1 - docker build -f Dockerfile --network=host -t cr.yandex/[id_registry]/app:hello .
2 - docker push cr.yandex/[id_registry]/app:hello
