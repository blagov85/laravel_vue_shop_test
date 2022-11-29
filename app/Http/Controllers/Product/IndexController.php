<?php

namespace App\Http\Controllers\Product;

use App\Models\Product;
use App\Http\Requests\Product\IndexRequest;
use App\Http\Controllers\Product\BaseController;

class IndexController extends BaseController
{
    public function __invoke(IndexRequest $request){
        $this->authorize('product-policy', [Product::class]);
        $data = $request->validated();
        $result = $this->service->index($data);

        $products = $result['products'];
        $categories = $result['categories'];
        $tags = $result['tags'];
        $colors = $result['colors'];
        $sizes = $result['sizes'];
        $brands = $result['brands'];
        $sex = $result['sex'];
        $materials = $result['materials'];
        $seasons = $result['seasons'];
        $countries = $result['countries'];

        return view('product.index', compact('products','categories',
                'tags', 'colors', 'sizes','brands', 'sex', 
                'materials', 'seasons', 'countries', 'data'));

    }
}
