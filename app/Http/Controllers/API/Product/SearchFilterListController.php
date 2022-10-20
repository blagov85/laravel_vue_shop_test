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



class SearchFilterListController extends Controller
{
    public function __invoke(Request $request){
        if( $request->has('search') ) {
            $search = $request->query('search');
        }else{
            $search = '';
        }
        $sorting = Sorting::all();
        $products = Product::with('category','brand','sex','country','materials','seasons','countProductsSizes','colors','tags')->where('title','like','%' . $search . '%')->get();
        $price = $products->sortBy('price')->pluck('price');
        $minPrice = $price->first();
        $maxPrice = $price->last();
        foreach($products as $product){
            $categoriesProd[$product->category->id] = $product->category; 
            $brandsProd[$product->brand->id] = $product->brand; 
            $sexProd[$product->sex->id] = $product->sex;
            $countriesProd[$product->country->id] = $product->country;
            foreach($product->materials as $materialOne){
                $materialsProd[$materialOne->id] = $materialOne; 
            }
            foreach($product->seasons as $seasonOne){
                $seasonsProd[$tagOne->id] = $seasonOne; 
            }
            foreach($product->countProductsSizes as $sizeOne){
                $sizesProd[$sizeOne->id] = $sizeOne; 
            }
            foreach($product->colors as $colorOne){
                $colorsProd[$colorOne->id] = $colorOne; 
            }
            foreach($product->tags as $tagOne){
                $tagsProd[$tagOne->id] = $tagOne; 
            }
        }
        foreach($categoriesProd as $category){
            $categories[] = $category;
        }
        foreach($brandsProd as $brand){
            $brands[] = $brand;
        }
        foreach($sexProd as $sexOne){
            $sex[] = $sexOne;
        }
        foreach($countriesProd as $country){
            $countries[] = $country;
        }
        foreach($materialsProd as $material){
            $materials[] = $material;
        }
        foreach($seasonsProd as $season){
            $seasons[] = $season;
        }
        foreach($sizesProd as $size){
            $sizes[] = $size;
        }
        foreach($colorsProd as $color){
            $colors[] = $color;
        }
        foreach($tagsProd as $tag){
            $tags[] = $tag;
        }
        usort($categories, fn($a, $b) => $a->id <=> $b->id);
        usort($brands, fn($a, $b) => $a->id <=> $b->id);
        usort($sex, fn($a, $b) => $a->id <=> $b->id);
        usort($countries, fn($a, $b) => $a->id <=> $b->id);
        usort($materials, fn($a, $b) => $a->id <=> $b->id);
        usort($seasons, fn($a, $b) => $a->id <=> $b->id);
        usort($sizes, fn($a, $b) => $a->id <=> $b->id);
        usort($colors, fn($a, $b) => $a->id <=> $b->id);
        usort($tags, fn($a, $b) => $a->id <=> $b->id);
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
