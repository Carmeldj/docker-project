FROM php:8.2
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN ["docker-php-ext-install", "pdo", "pdo_mysql"]
WORKDIR /app
COPY . /app
RUN composer install
ENTRYPOINT [ "./script.sh" ]
# CMD [ "php", "artisan", "serve", "--host=127.0.0.2",  "--port=8080"]