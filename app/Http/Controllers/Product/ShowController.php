<?php

namespace App\Http\Controllers\Product;

use App\Models\Product;
use App\Http\Controllers\Product\BaseController;

class ShowController extends BaseController
{
    public function __invoke(Product $product){
        $this->authorize('product-policy', [Product::class]);
        
        $result = $this->service->show($product);

        $tags = $result['tags'];
        $colors = $result['colors']; 
        $sizesCount = $result['sizesCount'];
        $seasons = $result['seasons'];
        $materialsPercent = $result['materialsPercent'];

        return view('product.show', compact('product', 'tags', 'colors', 'sizesCount', 'seasons', 'materialsPercent'));
    }
}
