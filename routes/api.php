<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/log', [App\Http\Controllers\API\AuthController::class, 'login']);
Route::post('/regist', [App\Http\Controllers\API\AuthController::class, 'register']);

// Send reset password mail
Route::post('/reset-password', [App\Http\Controllers\API\AuthController::class, 'sendPasswordResetLink']);   
// handle reset password form process
Route::post('/reset/password', [App\Http\Controllers\API\AuthController::class, 'callResetPassword']);

Route::group(['middleware' => 'auth:sanctum'], function(){
    Route::post('/logout', [App\Http\Controllers\API\AuthController::class, 'logout']);
    Route::post('/change-password', [App\Http\Controllers\API\ChangePasswordController::class, 'updatePassword']);
    Route::get('/user/name', App\Http\Controllers\API\User\ShowNameController::class);
    Route::get('/user', App\Http\Controllers\API\User\ShowController::class);
    Route::post('/user/update', App\Http\Controllers\API\User\UpdateController::class);
    Route::get('/product/{product}/like', App\Http\Controllers\API\Product\Like\StoreController::class);
    Route::get('/products/like', App\Http\Controllers\API\Product\Like\IndexController::class);
    Route::post('/product/{product}/feedback', App\Http\Controllers\API\Product\Feedback\StoreController::class);
    Route::get('/orders', App\Http\Controllers\API\Order\IndexController::class);
    Route::get('/order/{order}', App\Http\Controllers\API\Order\ShowController::class);
});
Route::post('/users', App\Http\Controllers\API\User\StoreController::class);

Route::post('/products', App\Http\Controllers\API\Product\IndexController::class);
Route::post('/orders', App\Http\Controllers\API\Order\StoreController::class);
Route::post('/compare', App\Http\Controllers\API\Product\CompareController::class);
Route::get('/products/filters', App\Http\Controllers\API\Product\FilterListController::class);
Route::get('/products/sorting', App\Http\Controllers\API\Product\SortProductsController::class);
Route::get('/product/{product}', App\Http\Controllers\API\Product\ShowController::class);
Route::get('/products/recent/{product}', App\Http\Controllers\API\Product\IndexRecentController::class);
Route::get('/products/search/filters', App\Http\Controllers\API\Product\SearchFilterListController::class);
Route::post('/products/search', App\Http\Controllers\API\Product\SearchController::class);
Route::get('/regions', App\Http\Controllers\API\User\IndexRegionController::class);
Route::get('/delivery_companies', App\Http\Controllers\API\Order\DeliveryCompany\IndexController::class);
Auth::routes();

