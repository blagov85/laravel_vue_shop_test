<?php

namespace App\Http\Controllers\API\Product\Like;

use app;
//use auth;
use App\Models\User;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\API\User\StoreRequest;
use App\Http\Resources\Product\Like\ProductLikeResource;



class StoreController extends Controller
{
    public function __invoke(Product $product){
        Auth::user()->likedProducts()->toggle($product->id);
        $product->refresh();
        return new ProductLikeResource($product);
    }
}
