<?php

use App\Http\Controllers\API\Pastry;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('pastry', [Pastry::class, 'index']);
Route::get('pastry/{id}', [Pastry::class, 'show']);
Route::post('pastry/create', [Pastry::class, 'store']);
Route::put('pastry/{id}/update', [Pastry::class, 'update']);
Route::delete('pastry/{id}/delete', [Pastry::class, 'destroy']);
