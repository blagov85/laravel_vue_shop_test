<?php

namespace App\Http\Controllers\API\Product\Like;

use app;
use App\Models\Product;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\Product\IndexProductResource;


class IndexController extends Controller
{
    public function __invoke(){
        // $products = Auth::user()->likedProducts;
        // return IndexProductResource::collection($products);
        return null;
    }
}
