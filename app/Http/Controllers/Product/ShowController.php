<?php

namespace App\Http\Controllers\Product;

use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ShowController extends Controller
{
    public function __invoke(Product $product){
        $this->authorize('product-policy', [Product::class]);
        $titleMaterials = $product->materials->pluck('title')->toArray();
        $tags = $product->tags->pluck('title')->toArray();
        $colors = $product->colors->pluck('title')->toArray();
        $titlesSize = $product->countProductsSizes->pluck('title')->toArray();
        $seasons = $product->seasons->pluck('title')->toArray();
        $materialsPercent = [];
        $percentList = Product::percentMaterialsFunc();
        foreach($product->materials as $key => $material){
            $materialsPercent[$titleMaterials[$key]] = $material->pivot->percent;
        }
        foreach($product->countProductsSizes as $key => $productCountSize){
            $sizesCount[$titlesSize[$key]] = $productCountSize->pivot->count;
        }
        return view('product.show', compact('product', 'tags', 'colors', 'sizesCount', 'seasons', 'materialsPercent'));
    }
}
