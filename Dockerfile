FROM php:8.2-cli

# Install required dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libsqlite3-dev \
    && docker-php-ext-install pdo pdo_sqlite

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
    
WORKDIR /var/www

COPY . .

RUN composer install --no-dev --optimize-autoloader

RUN php artisan config:clear

# Running on port 10000
EXPOSE 10000 

CMD php artisan serve --host=0.0.0.0 --port=10000
