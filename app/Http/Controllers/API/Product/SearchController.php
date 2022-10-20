<?php

namespace App\Http\Controllers\API\Product;


use app;
use App\Models\Product;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Filters\ProductFilter;
use App\Http\Controllers\Controller;
use App\Http\Requests\API\Product\IndexRequest;
use App\Http\Resources\Product\IndexProductResource;


class SearchController extends Controller
{
    public function __invoke(IndexRequest $request){
        $data = $request->validated();
        $filter = app()->make(ProductFilter::class, ['queryParams' => array_filter($data)]);
        $filterKey = $data['filterKey'];
        if($data['search']){
            $search = $data['search'];
        }else{
            $search = '';
        }
        //$products = Product::whereRaw("lower('title') LIKE ? ",'%'.trim(Str::lower($search)).'%')->get();
        $products = Product::where('title', 'like', '%' . $search . '%')->filter($filter);
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
