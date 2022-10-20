<?php

namespace App\Http\Controllers\API\Product;


use app;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\API\Product\CompareRequest;
use App\Http\Resources\Product\IndexProductResource;


class CompareController extends Controller
{
    public function __invoke(CompareRequest $request){
        $data = $request->validated();
        $products = Product::whereIn('id', $data['ids'])->get();
        return IndexProductResource::collection($products);
    }
}
