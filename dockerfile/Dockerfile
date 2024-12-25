FROM genotek/r-base:20210121

COPY index.php /var/www/html/
COPY conf.conf /etc/nginx/conf.d/

WORKDIR "/var/www/html"

RUN echo "deb [trusted=yes] http://mirror.yandex.ru/debian/ buster main non-free contrib" > /etc/apt/sources.list && rm -fr /etc/apt/sources.list.d/*
RUN apt-get update && apt-get install -y \
    nginx php-fpm && rm -fr /etc/nginx/sites-enabled/* &&  mkdir -p /run/php/

RUN rm  -rf /tmp/* /var/cache/apk/*

EXPOSE 80

#по правильному нужно разделить контейнеры на nginx  и fpm либо использовать супервизор что бы контролировать работу процесса, но это выходит за рамки тестового задания
ENTRYPOINT ["/bin/bash", "-c", "/etc/init.d/php7.3-fpm restart && nginx -g 'daemon off;'"]
