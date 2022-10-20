<?php

namespace App\Http\Controllers\API\Product;


use app;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Filters\ProductFilter;
use App\Http\Controllers\Controller;
use App\Http\Requests\API\Product\IndexRequest;
use App\Http\Resources\Product\IndexProductResource;


class IndexController extends Controller
{
    public function __invoke(IndexRequest $request){
        $data = $request->validated();
        $filter = app()->make(ProductFilter::class, ['queryParams' => array_filter($data)]);
        //$products = Product::filter($filter)->orderBy('price', 'asc')->paginate($data['countItemsPage'], ['*'], 'page', $data['page']);   
        $filterKey = $data['filterKey'];
        $products = Product::filter($filter);
        if($filterKey == Product::PRICE_ASC_KEY){
            $products = $products->orderBy('price', 'asc'); 
        }elseif($filterKey == Product::PRICE_DESC_KEY){
            $products = $products->orderBy('price', 'desc');
        }else{
            $products = $products;
        }
        $products = $products->paginate($data['countItemsPage'], ['*'], 'page', $data['page']);

        return IndexProductResource::collection($products);
    }
}
