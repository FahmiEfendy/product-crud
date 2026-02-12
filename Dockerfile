FROM php:8.2-cli

# Install required dependencies
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libsqlite3-dev \
    && docker-php-ext-install pdo pdo_sqlite \
    && rm -rf /var/lib/apt/lists/*

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Copy composer files first (for better layer caching)
COPY composer.json composer.lock ./

# Install dependencies with optimizations
RUN composer install \
    --no-dev \
    --optimize-autoloader \
    --no-interaction \
    --no-progress \
    --prefer-dist \
    --no-scripts

# Copy the rest of the application
COPY . .

# Ensure database folder exists and file exists
RUN mkdir -p database && touch database/database.sqlite
RUN chmod 777 database/database.sqlite

# Run post-autoload scripts now
RUN composer run-script post-autoload-dump --no-interaction || true

RUN php artisan config:clear

# Copy entrypoint script
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

# Expose port (Railway sets dynamic PORT)
EXPOSE 8000

# Start container via entrypoint
CMD ["./entrypoint.sh"]
