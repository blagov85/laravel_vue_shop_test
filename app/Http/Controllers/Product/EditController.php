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

class EditController extends Controller
{
    public function __invoke(Product $product){
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
        
        $currentPercents = [];
        foreach($product->materials as $material){
            array_push($currentPercents, $material->pivot->percent);
            //$filePath[][$material->title] = $material->pivot->percent;
        }
        //dd($filePath);
        //array 'xxs' => 2- example
        $titlesSize = $product->countProductsSizes->pluck('title')->toArray();
        foreach($product->countProductsSizes as $key => $productCountSize){
            $sizesCount[$titlesSize[$key]] = $productCountSize->pivot->count;
        }
        
        return view('product.edit', compact('product','categories',
                'groups','tags', 'colors', 'sizes', 'sizesCount',
                'brands', 'sex', 'materials', 'percent_materials',
                'currentPercents', 'seasons', 'countries'));    
                
    }
}