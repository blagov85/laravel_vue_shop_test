<?php

namespace App\Http\Controllers\Product;

use App\Models\Product;
use App\Http\Controllers\Product\BaseController;

class CreateController extends BaseController
{
    public function __invoke(){
        $this->authorize('product-policy', [Product::class]);
        
        $result = $this->service->create();

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

        return view('product.create', 
            compact('categories', 'groups', 'tags', 'colors', 
                'sizes', 'brands', 'sex', 'materials', 'percent_materials',
                'seasons', 'countries'));
    }

}
