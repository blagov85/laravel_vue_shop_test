<?php

namespace App\Http\Controllers\API\Product;

use App\Http\Controllers\API\Product\BaseController;
use Illuminate\Http\Request;
use App\Http\Resources\Filter\FilterResource;

class SearchFilterListController extends BaseController
{
    public function __invoke(Request $request){
        if( $request->has('search') ) {
            $search = $request->query('search');
        }else{
            $search = '';
        }
        $result = $this->service->searchFilter($search);
        if($result == null){
            return null;
        }
        // $resultJSON = [
        //     'categories' => $result['categories'],
        //     'brands' => $result['brands'],
        //     'sex' => $result['sex'],
        //     'countries' => $result['countries'],
        //     'materials' => $result['materials'],
        //     'seasons' => $result['seasons'],
        //     'sizes' => $result['sizes'],
        //     'colors' => $result['colors'],
        //     'tags' => $result['tags'],
        //     'price' => [
        //         'min' => $result['minPrice'],
        //         'max' => $result['maxPrice']
        //     ],
        //     'sorting' => $result['sorting']
        // ];
        return new FilterResource($result);
        //return response()->json($resultJSON);
    }
}
