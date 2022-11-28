<?php

namespace App\Http\Controllers\Product;

use App\Models\Product;
use App\Http\Controllers\Product\BaseController;

class EditController extends BaseController
{
    public function __invoke(Product $product){
        $this->authorize('product-policy', [Product::class]);
        
        $result = $this->service->edit($product);

        $categories = $result['categories'];
        $groups = $result['groups'];
        $tags = $result['tags'];
        $colors = $result['colors'];
        $sizes = $result['sizes'];
        $brands = $result['brands'];
        $sex = $result['sex'];
        $materials = $result['materials'];
        $percent_materials = $result['percent_materials'];
        $seasons = $result['seasons'];
        $countries = $result['countries'];
        $currentPercents = $result['currentPercents'];
        $sizesCount = $result['sizesCount'];

        return view('product.edit', compact('product','categories',
                'groups','tags', 'colors', 'sizes', 'sizesCount',
                'brands', 'sex', 'materials', 'percent_materials',
                'currentPercents', 'seasons', 'countries'));               
    }
}