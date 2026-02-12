#!/bin/sh
set -e

# Run migrations
php artisan migrate --force

# Start Laravel server on Railway dynamic port
php artisan serve --host=0.0.0.0 --port=$PORT
