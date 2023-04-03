<?php

namespace App\Http\Controllers\API\Product;

use App\Models\Sorting;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class SortProductsController extends Controller
{
    public function __invoke(Request $request){
        
        $sorting = Sorting::all();
        $resultJSON = [
            'data' => $sorting
        ];

        return response()->json($sorting);
    }
}
