<?php

namespace App\Services\API\Product;

use Exception;
use App\Models\ProductImage;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

use App\Models\Sex;
use App\Models\Tag;
use App\Models\Size;
use App\Models\Brand;
use App\Models\Color;
use App\Models\Group;
use App\Models\Season;
use App\Models\Country;
use App\Models\Category;
use App\Models\Material;
use App\Models\Sorting;

use app;
use App\Models\Product;
use App\Http\Filters\ProductFilterAPI;

class ProductService
{
    public function index($data){
        $filter = app()->make(ProductFilterAPI::class, ['queryParams' => array_filter($data)]);
        $filterKey = $data['filterKey'];
        $products = Product::filter($filter)->has('countProductsSizes');
        if($filterKey == Product::PRICE_ASC_KEY){
            $products = $products->orderBy('price', 'asc'); 
        }elseif($filterKey == Product::PRICE_DESC_KEY){
            $products = $products->orderBy('price', 'desc');
        }else{
            $products = $products;
        }
        $products = $products->paginate($data['countItemsPage'], ['*'], 'page', $data['page']);
        return $products;
    }

    public function filterList(){
        $result = [];
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

        $result['categories'] = $categories;
        $result['brands'] = $brands;
        $result['sex'] = $sex;
        $result['countries'] = $countries;
        $result['materials'] = $materials;
        $result['seasons'] = $seasons;
        $result['sizes'] = $sizes;
        $result['colors'] = $colors;
        $result['tags'] = $tags;
        $result['sorting'] = $sorting;
        $result['minPrice'] = $minPrice;
        $result['maxPrice'] = $maxPrice;

        return $result;
    }

    public function search($data){
        $filter = app()->make(ProductFilterAPI::class, ['queryParams' => array_filter($data)]);
        
        if($data['search']){
            $products = Product::where('title', 'like', '%' . $data['search'] . '%')->filter($filter)->has('countProductsSizes');
        }else{
            $products = Product::filter($filter)->has('countProductsSizes');
        }

        $filterKey = $data['filterKey'];
        if($filterKey == Product::PRICE_ASC_KEY){
            $products = $products->orderBy('price', 'asc'); 
        }elseif($filterKey == Product::PRICE_DESC_KEY){
            $products = $products->orderBy('price', 'desc');
        }else{
            $products = $products;
        }
        $products = $products->paginate($data['countItemsPage'], ['*'], 'page', $data['page']);
        
        return $products;
    }

    public function searchFilter($search){
        if($search){
            $products = Product::with('category','brand','sex','country','materials','seasons','countProductsSizes','colors','tags')->where('title','like','%' . $search . '%')->has('countProductsSizes')->get();
        }else{
            $products = Product::with('category','brand','sex','country','materials','seasons','countProductsSizes','colors','tags')->has('countProductsSizes')->get();
        }
        if($products->isEmpty()){
            return null;
        }
        $price = $products->sortBy('price')->pluck('price');
        $minPrice = $price->first();
        $maxPrice = $price->last();
        $categoriesProd = [];
        $brandsProd = [];
        $sexProd = [];
        $countriesProd = [];
        $materialsProd = [];
        $seasonsProd = [];
        $sizesProd = [];
        $colorsProd = [];
        $tagsProd = [];
        foreach($products as $product){
            $categoriesProd[$product->category->id] = $product->category; 
            $brandsProd[$product->brand->id] = $product->brand; 
            $sexProd[$product->sex->id] = $product->sex;
            $countriesProd[$product->country->id] = $product->country;
            foreach($product->materials as $materialOne){
                $materialsProd[$materialOne->id] = $materialOne; 
            }
            foreach($product->seasons as $seasonOne){
                $seasonsProd[$seasonOne->id] = $seasonOne; 
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

        // $result['categories'] = $categories;
        // $result['brands'] = $brands;
        // $result['sex'] = $sex;
        // $result['countries'] = $countries;
        // $result['materials'] = $materials;
        // $result['seasons'] = $seasons;
        // $result['sizes'] = $sizes;
        // $result['colors'] = $colors;
        // $result['tags'] = $tags;
        // $result['sorting'] = $sorting;
        // $result['minPrice'] = $minPrice;
        // $result['maxPrice'] = $maxPrice;

        $result = collect();
        $result->categories = $categories;
        $result->brands = $brands;
        $result->sex = $sex;
        $result->countries = $countries;
        $result->materials = $materials;
        $result->seasons = $seasons;
        $result->sizes = $sizes;
        $result->colors = $colors;
        $result->tags = $tags;
        $result->minPrice = $minPrice;
        $result->maxPrice = $maxPrice;
        return $result;
    }

    public function edit($product){
          
    }
}
