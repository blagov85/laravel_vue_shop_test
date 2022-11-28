<?php

namespace App\Http\Controllers\API\Product;


// use app;
// use App\Models\Product;
// use Illuminate\Support\Str;
// use Illuminate\Http\Request;
// use Illuminate\Support\Facades\DB;
// use App\Http\Filters\ProductFilter;
use App\Http\Controllers\API\Product\BaseController;
use App\Http\Requests\API\Product\IndexRequest;
use App\Http\Resources\Product\IndexProductResource;


class SearchController extends BaseController
{
    public function __invoke(IndexRequest $request){
        $data = $request->validated();
        $products = $this->service->search($data);
        return IndexProductResource::collection($products);
    }
}
