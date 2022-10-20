<?php

namespace App\Http\Controllers\API\Product;


use App\Models\Sex;
use App\Models\Tag;
use App\Models\Size;
use App\Models\Brand;
use App\Models\Color;
use App\Models\Season;
use App\Models\Country;
use App\Models\Product;
use App\Models\Sorting;
use App\Models\Category;
use App\Models\Material;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;



class FilterListController extends Controller
{
    public function __invoke(){
        $categories = Category::all();
        $brands = Brand::all();
        $sex = Sex::all();
        $countries = Country::all();
        $seasons = Season::all();
        $materials = Material::all();
        $sizes = Size::all();
        $colors = Color::all();
        $tags = Tag::all();
        $sorting = Sorting::all();

        $maxPrice = Product::orderBy('price', 'DESC')->first()->price;
        $minPrice = Product::orderBy('price', 'ASC')->first()->price;

        $result = [
            'categories' => $categories,
            'brands' => $brands,
            'sex' => $sex,
            'countries' => $countries,
            'materials' => $materials,
            'seasons' => $seasons,
            'sizes' => $sizes,
            'colors' => $colors,
            'tags' => $tags,
            'price' => [
                'min' => $minPrice,
                'max' => $maxPrice
            ],
            'sorting' => $sorting

        ];

        return response()->json($result);
    }
}
