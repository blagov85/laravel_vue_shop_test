<?php

namespace App\Http\Controllers\Product;

use App\Models\Sex;
use App\Models\Tag;
use App\Models\Size;
use App\Models\Brand;
use App\Models\Color;
use App\Models\Group;
use App\Models\Season;
use App\Models\Country;
use App\Models\Product;
use App\Models\Category;
use App\Models\Material;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CreateController extends Controller
{
    public function __invoke(Request $request){
        $this->authorize('feedback-policy', [Feedback::class]);
        $feedbacks = Feedback::all();

        return view('product.create', 
            compact('categories', 'groups', 'tags', 'colors', 
                'sizes', 'brands', 'sex', 'materials', 'percent_materials',
                'seasons', 'countries'));
    }

}
