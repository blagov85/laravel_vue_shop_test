<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::group(['prefix' => 'admin', 'middleware' => ['auth', 'admin']], function(){
    
    Route::get('/', App\Http\Controllers\Main\IndexController::class)->name('main.index');

    Route::group(['prefix' => 'orders'], function() {
        Route::get('/', App\Http\Controllers\Order\IndexController::class)->name('order.index');
        Route::post('/', App\Http\Controllers\Order\StoreController::class)->name('order.store');
        Route::get('/{order}', App\Http\Controllers\Order\ShowController::class)->name('order.show');
        Route::get('/{order}/edit', App\Http\Controllers\Order\EditController::class)->name('order.edit');
        Route::patch('/{order}', App\Http\Controllers\Order\UpdateController::class)->name('order.update');
        Route::delete('/{order}', App\Http\Controllers\Order\DeleteController::class)->name('order.delete');
        
        Route::group(['prefix' => 'change-status'], function(){
            Route::patch('/{order}', App\Http\Controllers\Order\ChangeStatus\UpdateController::class)->name('order.change_status.update');
        });

        Route::group(['prefix' => 'add-product'], function(){
            Route::get('/{order}/edit', App\Http\Controllers\Order\AddProduct\EditController::class)->name('order.add_product.edit');
            Route::patch('/{order}', App\Http\Controllers\Order\AddProduct\UpdateController::class)->name('order.add_product.update');
        });

    });

    Route::group(['prefix' => 'categories'], function() {
        Route::get('/', App\Http\Controllers\Category\IndexController::class)->name('category.index');
        Route::get('/create', App\Http\Controllers\Category\CreateController::class)->name('category.create');
        Route::post('/', App\Http\Controllers\Category\StoreController::class)->name('category.store');
        Route::get('/{category}', App\Http\Controllers\Category\ShowController::class)->name('category.show');
        Route::get('/{category}/edit', App\Http\Controllers\Category\EditController::class)->name('category.edit');
        Route::patch('/{category}', App\Http\Controllers\Category\UpdateController::class)->name('category.update');
        Route::delete('/{category}', App\Http\Controllers\Category\DeleteController::class)->name('category.delete');
    });
    
    Route::group(['prefix' => 'tags'], function() {
        Route::get('/', App\Http\Controllers\Tag\IndexController::class)->name('tag.index');
        Route::get('/create', App\Http\Controllers\Tag\CreateController::class)->name('tag.create');
        Route::post('/', App\Http\Controllers\Tag\StoreController::class)->name('tag.store');
        Route::get('/{tag}', App\Http\Controllers\Tag\ShowController::class)->name('tag.show');
        Route::get('/{tag}/edit', App\Http\Controllers\Tag\EditController::class)->name('tag.edit');
        Route::patch('/{tag}', App\Http\Controllers\Tag\UpdateController::class)->name('tag.update');
        Route::delete('/{tag}', App\Http\Controllers\Tag\DeleteController::class)->name('tag.delete');
    });
    
    Route::group(['prefix' => 'colors'], function() {
        Route::get('/', App\Http\Controllers\Color\IndexController::class)->name('color.index');
        Route::get('/create', App\Http\Controllers\Color\CreateController::class)->name('color.create');
        Route::post('/', App\Http\Controllers\Color\StoreController::class)->name('color.store');
        Route::get('/{color}', App\Http\Controllers\Color\ShowController::class)->name('color.show');
        Route::get('/{color}/edit', App\Http\Controllers\Color\EditController::class)->name('color.edit');
        Route::patch('/{color}', App\Http\Controllers\Color\UpdateController::class)->name('color.update');
        Route::delete('/{color}', App\Http\Controllers\Color\DeleteController::class)->name('color.delete');
    });
    
    Route::group(['prefix' => 'users'], function() {
        Route::get('/', App\Http\Controllers\User\IndexController::class)->name('user.index');
        Route::get('/create', App\Http\Controllers\User\CreateController::class)->name('user.create');
        Route::post('/', App\Http\Controllers\User\StoreController::class)->name('user.store');
        Route::get('/{user}', App\Http\Controllers\User\ShowController::class)->name('user.show');
        Route::get('/{user}/edit', App\Http\Controllers\User\EditController::class)->name('user.edit');
        Route::patch('/{user}', App\Http\Controllers\User\UpdateController::class)->name('user.update');
        Route::delete('/{user}', App\Http\Controllers\User\DeleteController::class)->name('user.delete');
    });

    Route::group(['prefix' => 'roles'], function() {
        Route::get('/', App\Http\Controllers\Role\IndexController::class)->name('role.index');
        Route::get('/create', App\Http\Controllers\Role\CreateController::class)->name('role.create');
        Route::post('/', App\Http\Controllers\Role\StoreController::class)->name('role.store');
        Route::get('/{role}', App\Http\Controllers\Role\ShowController::class)->name('role.show');
        Route::get('/{role}/edit', App\Http\Controllers\Role\EditController::class)->name('role.edit');
        Route::patch('/{role}', App\Http\Controllers\Role\UpdateController::class)->name('role.update');
        Route::delete('/{role}', App\Http\Controllers\Role\DeleteController::class)->name('role.delete');
    });
    
    Route::group(['prefix' => 'products'], function() {
        Route::get('/', App\Http\Controllers\Product\IndexController::class)->name('product.index');
        Route::get('/create', App\Http\Controllers\Product\CreateController::class)->name('product.create');
        Route::post('/', App\Http\Controllers\Product\StoreController::class)->name('product.store');
        Route::get('/{product}', App\Http\Controllers\Product\ShowController::class)->name('product.show');
        Route::get('/{product}/edit', App\Http\Controllers\Product\EditController::class)->name('product.edit');
        Route::patch('/{product}', App\Http\Controllers\Product\UpdateController::class)->name('product.update');
        Route::delete('/{product}', App\Http\Controllers\Product\DeleteController::class)->name('product.delete');
    });
    
    Route::group(['prefix' => 'groups'], function() {
        Route::get('/', App\Http\Controllers\Group\IndexController::class)->name('group.index');
        Route::get('/create', App\Http\Controllers\Group\CreateController::class)->name('group.create');
        Route::post('/', App\Http\Controllers\Group\StoreController::class)->name('group.store');
        Route::get('/{group}', App\Http\Controllers\Group\ShowController::class)->name('group.show');
        Route::get('/{group}/edit', App\Http\Controllers\Group\EditController::class)->name('group.edit');
        Route::patch('/{group}', App\Http\Controllers\Group\UpdateController::class)->name('group.update');
        Route::delete('/{group}', App\Http\Controllers\Group\DeleteController::class)->name('group.delete');
    });

    Route::group(['prefix' => 'sizes'], function() {
        Route::get('/', App\Http\Controllers\Size\IndexController::class)->name('size.index');
        Route::get('/create', App\Http\Controllers\Size\CreateController::class)->name('size.create');
        Route::post('/', App\Http\Controllers\Size\StoreController::class)->name('size.store');
        Route::get('/{size}', App\Http\Controllers\Size\ShowController::class)->name('size.show');
        Route::get('/{size}/edit', App\Http\Controllers\Size\EditController::class)->name('size.edit');
        Route::patch('/{size}', App\Http\Controllers\Size\UpdateController::class)->name('size.update');
        Route::delete('/{size}', App\Http\Controllers\Size\DeleteController::class)->name('size.delete');
    });

    Route::group(['prefix' => 'countries'], function() {
        Route::get('/', App\Http\Controllers\Country\IndexController::class)->name('country.index');
        Route::get('/create', App\Http\Controllers\Country\CreateController::class)->name('country.create');
        Route::post('/', App\Http\Controllers\Country\StoreController::class)->name('country.store');
        Route::get('/{country}', App\Http\Controllers\Country\ShowController::class)->name('country.show');
        Route::get('/{country}/edit', App\Http\Controllers\Country\EditController::class)->name('country.edit');
        Route::patch('/{country}', App\Http\Controllers\Country\UpdateController::class)->name('country.update');
        Route::delete('/{country}', App\Http\Controllers\Country\DeleteController::class)->name('country.delete');
    });

    Route::group(['prefix' => 'brands'], function() {
        Route::get('/', App\Http\Controllers\Brand\IndexController::class)->name('brand.index');
        Route::get('/create', App\Http\Controllers\Brand\CreateController::class)->name('brand.create');
        Route::post('/', App\Http\Controllers\Brand\StoreController::class)->name('brand.store');
        Route::get('/{brand}', App\Http\Controllers\Brand\ShowController::class)->name('brand.show');
        Route::get('/{brand}/edit', App\Http\Controllers\Brand\EditController::class)->name('brand.edit');
        Route::patch('/{brand}', App\Http\Controllers\Brand\UpdateController::class)->name('brand.update');
        Route::delete('/{brand}', App\Http\Controllers\Brand\DeleteController::class)->name('brand.delete');
    });

    Route::group(['prefix' => 'materials'], function() {
        Route::get('/', App\Http\Controllers\Material\IndexController::class)->name('material.index');
        Route::get('/create', App\Http\Controllers\Material\CreateController::class)->name('material.create');
        Route::post('/', App\Http\Controllers\Material\StoreController::class)->name('material.store');
        Route::get('/{material}', App\Http\Controllers\Material\ShowController::class)->name('material.show');
        Route::get('/{material}/edit', App\Http\Controllers\Material\EditController::class)->name('material.edit');
        Route::patch('/{material}', App\Http\Controllers\Material\UpdateController::class)->name('material.update');
        Route::delete('/{material}', App\Http\Controllers\Material\DeleteController::class)->name('material.delete');
    });

    Route::group(['prefix' => 'seasons'], function() {
        Route::get('/', App\Http\Controllers\Season\IndexController::class)->name('season.index');
        Route::get('/create', App\Http\Controllers\Season\CreateController::class)->name('season.create');
        Route::post('/', App\Http\Controllers\Season\StoreController::class)->name('season.store');
        Route::get('/{season}', App\Http\Controllers\Season\ShowController::class)->name('season.show');
        Route::get('/{season}/edit', App\Http\Controllers\Season\EditController::class)->name('season.edit');
        Route::patch('/{season}', App\Http\Controllers\Season\UpdateController::class)->name('season.update');
        Route::delete('/{season}', App\Http\Controllers\Season\DeleteController::class)->name('season.delete');
    });

    Route::group(['prefix' => 'delivery_companies'], function() {
        Route::get('/', App\Http\Controllers\DeliveryCompany\IndexController::class)->name('delivery_company.index');
        Route::get('/create', App\Http\Controllers\DeliveryCompany\CreateController::class)->name('delivery_company.create');
        Route::post('/', App\Http\Controllers\DeliveryCompany\StoreController::class)->name('delivery_company.store');
        Route::get('/{deliveryCompany}', App\Http\Controllers\DeliveryCompany\ShowController::class)->name('delivery_company.show');
        Route::get('/{deliveryCompany}/edit', App\Http\Controllers\DeliveryCompany\EditController::class)->name('delivery_company.edit');
        Route::patch('/{deliveryCompany}', App\Http\Controllers\DeliveryCompany\UpdateController::class)->name('delivery_company.update');
        Route::delete('/{deliveryCompany}', App\Http\Controllers\DeliveryCompany\DeleteController::class)->name('delivery_company.delete');
    });

    Route::group(['prefix' => 'sex'], function() {
        Route::get('/', App\Http\Controllers\Sex\IndexController::class)->name('sex.index');
        Route::get('/create', App\Http\Controllers\Sex\CreateController::class)->name('sex.create');
        Route::post('/', App\Http\Controllers\Sex\StoreController::class)->name('sex.store');
        Route::get('/{sex}', App\Http\Controllers\Sex\ShowController::class)->name('sex.show');
        Route::get('/{sex}/edit', App\Http\Controllers\Sex\EditController::class)->name('sex.edit');
        Route::patch('/{sex}', App\Http\Controllers\Sex\UpdateController::class)->name('sex.update');
        Route::delete('/{sex}', App\Http\Controllers\Sex\DeleteController::class)->name('sex.delete');
    });

    Route::group(['prefix' => 'feedbacks'], function() {
        Route::get('/', App\Http\Controllers\Feedback\IndexController::class)->name('feedback.index');
        Route::post('/{filter?}', App\Http\Controllers\Feedback\IndexController::class)->name('feedback.index');
        Route::patch('/', App\Http\Controllers\Feedback\UpdateController::class)->name('feedback.update');
    //     Route::get('/create', App\Http\Controllers\Season\CreateController::class)->name('season.create');
    //     Route::post('/', App\Http\Controllers\Season\StoreController::class)->name('season.store');
    //     Route::get('/{season}', App\Http\Controllers\Season\ShowController::class)->name('season.show');
    //     Route::get('/{season}/edit', App\Http\Controllers\Season\EditController::class)->name('season.edit');
    //     Route::patch('/{season}', App\Http\Controllers\Season\UpdateController::class)->name('season.update');
    //     Route::delete('/{season}', App\Http\Controllers\Season\DeleteController::class)->name('season.delete');
    });

});

Auth::routes();
Auth::routes(['verify' => true]);

Route::get('{page}', App\Http\Controllers\Client\IndexController::class)->where('page', '.*');

    



