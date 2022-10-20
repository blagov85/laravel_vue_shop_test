<?php

namespace App\Http\Controllers\Product;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('product-policy', [Product::class]);
        $products = Product::all();
        return view('product.index', compact('products'));
    }
}
