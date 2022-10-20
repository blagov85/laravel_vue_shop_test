<?php

namespace App\Http\Controllers\API\Product;


use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Product\ProductResource;


class ShowController extends Controller
{
    public function __invoke(Product $product){
        return new ProductResource($product);
    }
}
