<?php

namespace App\Http\Controllers\API\Product;

use App\Http\Controllers\API\Product\BaseController;
use App\Http\Requests\API\Product\IndexRequest;
use App\Http\Resources\Product\IndexProductResource;


class IndexController extends BaseController
{
    public function __invoke(IndexRequest $request){
        $data = $request->validated();
        $products = $this->service->index($data);
        return IndexProductResource::collection($products);
    }
}
