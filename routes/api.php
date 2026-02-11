<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProductController;

// GET All Products
Route::get('/products', [ProductController::class, 'index']);

// GET Product Detail
Route::get('/product/{id}', [ProductController::class, 'show']);

// POST Create Product
Route::post('/product', [ProductController::class, 'store']);

// PATCH Update Product
Route::patch('/product/{id}', [ProductController::class, 'update']);

// DELETE Product
Route::delete('/product/{id}', [ProductController::class, 'destroy']);

// POST Sync Products
Route::post('/products/sync', [ProductController::class, 'syncProducts']);