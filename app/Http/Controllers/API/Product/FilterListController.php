<?php

namespace App\Http\Controllers\API\Product;

use App\Http\Controllers\API\Product\BaseController;


class FilterListController extends BaseController
{
    public function __invoke(){
        $result = $this->service->filterList();
        $resultJSON = [
            'categories' => $result['categories'],
            'brands' => $result['brands'],
            'sex' => $result['sex'],
            'countries' => $result['countries'],
            'materials' => $result['materials'],
            'seasons' => $result['seasons'],
            'sizes' => $result['sizes'],
            'colors' => $result['colors'],
            'tags' => $result['tags'],
            'price' => [
                'min' => $result['minPrice'],
                'max' => $result['maxPrice']
            ],
            'sorting' => $result['sorting']
        ];

        return response()->json($resultJSON);
    }
}
