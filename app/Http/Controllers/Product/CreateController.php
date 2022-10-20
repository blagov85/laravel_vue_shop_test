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
    public function __invoke(){
        $this->authorize('product-policy', [Product::class]);
        $categories = Category::all();
        $groups = Group::all();
        $tags = Tag::all();
        $colors = Color::all();
        $sizes = Size::all();
        $brands = Brand::all();
        $sex = Sex::all();
        $materials = Material::all();
        $percent_materials = Product::percentMaterialsFunc();
        $seasons = Season::all();
        $countries = Country::all();

        return view('product.create', 
            compact('categories', 'groups', 'tags', 'colors', 
                'sizes', 'brands', 'sex', 'materials', 'percent_materials',
                'seasons', 'countries'));
    }

}
