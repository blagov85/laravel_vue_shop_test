<?php

namespace App\Http\Controllers\API\Product;


use app;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Filters\ProductFilter;
use App\Http\Controllers\Controller;
use App\Http\Requests\API\Product\IndexRequest;
use App\Http\Resources\Product\IndexProductResource;


class IndexRecentController extends Controller
{
    public function __invoke(Product $product){
        $recentProducts = Product::where('category_id', $product->category_id)->orderBy('created_at', 'desc')->take(6)->get();
        return IndexProductResource::collection($recentProducts);
    }
}
