# 🛒 Product Dashboard – Backend API
A RESTful API built with Laravel to manage product data.
This API handles CRUD operations and product synchronization.


# ✨ Features
- Get all products
- Get product detail
- Sync products from external source
- Create product
- Update product
- Delete product


# 🛠 Tech Stack
- Framework: Laravel
- Database: SQLite
- API Type: REST
- Validation: Laravel Request Validation


# 🔗 API Endpoints
- GET /products - Get all products
- GET /product/{id} - Get product detail
- POST /product - Create product
- PATCH /product/{id} - Update product
- DELETE /product/{id} - Delete product
- POST /products/sync - Sync product with external API


# 🚀 Getting Started

## Requirements
- XAMPP (Apache enabled)

## Steps
```bash
https://github.com/FahmiEfendy/product-crud.git # clone repository

cd product-crud # access application

composer install # install dependencies

php artisan migrate # run database migration

php artisan serve # run server
```
After running the command, the application will be available at: http://127.0.0.1:8000/api


# 🧑‍💻 Author
- Email: itsfahmiefendy@gmail.com
- LinkedIn: [https://www.linkedin.com/in/fahmi-efendy](https://www.linkedin.com/in/fahmi-efendy)
