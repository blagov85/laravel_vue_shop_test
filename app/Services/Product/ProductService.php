<?php

namespace App\Services\Product;

use Exception;
use App\Models\Product;
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

class ProductService
{
    public function create(){
        $result = [];
        $result['categories'] = Category::all();
        $result['groups'] = Group::all();
        $result['tags'] = Tag::all();
        $result['colors'] = Color::all();
        $result['sizes'] = Size::all();
        $result['brands'] = Brand::all();
        $result['sex'] = Sex::all();
        $result['materials'] = Material::all();
        $result['percent_materials'] = Product::percentMaterialsFunc();
        $result['seasons'] = Season::all();
        $result['countries'] = Country::all();
        return $result;
    }

    public function show($product){
        $result = [];
        $titleMaterials = $product->materials->pluck('title')->toArray();
        $result['tags'] = $product->tags->pluck('title')->toArray();
        $result['colors'] = $product->colors->pluck('title')->toArray();
        $titlesSize = $product->countProductsSizes->pluck('title')->toArray();
        $seasons = $product->seasons->pluck('title')->toArray();
        $materialsPercent = [];
        $percentList = Product::percentMaterialsFunc();
        foreach($product->materials as $key => $material){
            $materialsPercent[$titleMaterials[$key]] = $material->pivot->percent;
        }
        foreach($product->countProductsSizes as $key => $productCountSize){
            $sizesCount[$titlesSize[$key]] = $productCountSize->pivot->count;
        }
        $result['sizesCount'] = $sizesCount;
        $result['seasons'] = $seasons;
        $result['materialsPercent'] = $materialsPercent;

        return $result;
    }

    public function edit($product){
        $result = [];
        $result['categories'] = Category::all();
        $result['groups'] = Group::all();
        $result['tags'] = Tag::all();
        $result['colors'] = Color::all();
        $result['sizes'] = Size::all();
        $result['brands'] = Brand::all();
        $result['sex'] = Sex::all();
        $result['materials'] = Material::all();
        $result['percent_materials'] = Product::percentMaterialsFunc();
        $result['seasons'] = Season::all();
        $result['countries'] = Country::all();

        $currentPercents = [];
        foreach($product->materials as $material){
            array_push($currentPercents, $material->pivot->percent);
        }
        
        $titlesSize = $product->countProductsSizes->pluck('title')->toArray();
        foreach($product->countProductsSizes as $key => $productCountSize){
            $sizesCount[$titlesSize[$key]] = $productCountSize->pivot->count;
        }
        $result['currentPercents'] = $currentPercents;
        $result['sizesCount'] = $sizesCount;

        return $result;
    }

    public function store($data){
        DB::beginTransaction();
        if(isset($data['product_images'])){
            $productImages = $data['product_images'];
            unset($data['product_images']);
        }
        //counts of sizes
        if(isset($data['counts'])){
            $arrayCounts = $data['counts'];
            $arrayIdsSizes = $data['size_ids'];
            for($i=0;$i<count($arrayCounts);$i++){
                if($arrayCounts[$i] > 0){
                    $productCountsArray[$arrayIdsSizes[$i]]['count'] = $arrayCounts[$i];
                }
            }
            unset($data['counts'], $data['size_ids']);
        }    
        //end counts of sizes  
        
        //percent of materials
        if(isset($data['materials'])){
            $materialIds = $data['materials'];
            unset($data['materials']);
            $countMaterial = count($materialIds);
            if($countMaterial == 1){//select 1 material
                $materialPercentArray[$materialIds[0]]['percent'] = 100;
            } else {//select several materials
                if(isset($data['percent_materials'])){//select percent of material
                    $percentCount = $data['percent_materials'];
                    unset($data['percent_materials']);
                    $countPercent = count($percentCount);
                    if($countMaterial === $countPercent){//select same count material and percent of material
                        for($i=0;$i<$countMaterial;$i++){
                            $materialPercentArray[$materialIds[$i]]['percent'] = $percentCount[$i];
                        }
                    }else{//select different count material and percent of material
                        for($i=0;$i<$countMaterial;$i++){
                            $materialPercentArray[$materialIds[$i]]['percent'] = '';
                        }
                    }
                }else{//no select percent of material
                    for($i=0;$i<$countMaterial;$i++){
                        $materialPercentArray[$materialIds[$i]]['percent'] = '';
                    }
                }
            }
        }  
        
        //end counts of sizes
        $data['preview_image'] = Storage::disk('public')->put('/images', $data['preview_image']);
        
        if (isset($data['seasons'])){
            $seasonIds = $data['seasons'];
            unset($data['seasons']);
        }
        
        if (isset($data['tags'])){
            $tagIds = $data['tags'];
            unset($data['tags']);
        }
        if (isset($data['colors'])){
            $colorIds = $data['colors'];
            unset($data['colors']);
        }

        $data['count'] = 1;
        $product = Product::firstOrCreate(['title' => $data['title']], $data);

        if (isset($materialPercentArray)){
            $product->materials()->attach($materialPercentArray);
        }

        if (isset($productCountsArray)){
            $product->countProductsSizes()->attach($productCountsArray);
        }
        if (isset($seasonIds)){
            $product->seasons()->attach($seasonIds);
        }
        
        if (isset($tagIds)){
            $product->tags()->attach($tagIds);
        }
        if (isset($colorIds)){
            $product->colors()->attach($colorIds);
        }

        if (isset($productImages)){
            foreach($productImages as $productImage){
                $filePath[]['file_path'] = Storage::disk('public')->put('/images', $productImage);
            }
            if (is_array($filePath)){
                $product->productImages()->createMany($filePath);
            }
        }
        DB::commit();
    }

    public function update($product, $data){
        
        DB::beginTransaction();
        if (isset($data['preview_image'])){
            if (Storage::disk('public')->exists($product->preview_image)){
                Storage::disk('public')->delete($product->preview_image);
            }
            $data['preview_image'] = Storage::disk('public')->put('/images', $data['preview_image']);
        }
        
        //counts of sizes
        if(isset($data['counts'])){
            $arrayCounts = $data['counts'];
            $arrayIdsSizes = $data['size_ids'];
            for($i=0;$i<count($arrayCounts);$i++){
                if($arrayCounts[$i] > 0){
                    $productCountsArray[$arrayIdsSizes[$i]]['count'] = $arrayCounts[$i];
                }
            }
            unset($data['counts'],  $data['size_ids']);
        }    
        //end counts of sizes  
        if (isset($productCountsArray)){
            $product->countProductsSizes()->sync($productCountsArray);
        }

        if(isset($data['materials'])){
            $materialIds = $data['materials'];
            unset($data['materials']);
            $countMaterial = count($materialIds);
            if($countMaterial == 1){//select 1 material
                $materialPercentArray[$materialIds[0]]['percent'] = 100;
                unset($data['percent_materials']);
            } else {//select several materials
                if(isset($data['percent_materials'])){//select percent of material
                    $percentCount = $data['percent_materials'];
                    unset($data['percent_materials']);
                    $countPercent = count($percentCount);
                    if($countMaterial === $countPercent){//select same count material and percent of material
                        for($i=0;$i<$countMaterial;$i++){
                            $materialPercentArray[$materialIds[$i]]['percent'] = $percentCount[$i];
                        }
                    }else{//select different count material and percent of material
                        for($i=0;$i<$countMaterial;$i++){
                            $materialPercentArray[$materialIds[$i]]['percent'] = '';
                        }
                    }
                }else{//no select percent of material
                    for($i=0;$i<$countMaterial;$i++){
                        $materialPercentArray[$materialIds[$i]]['percent'] = '';
                    }
                }
            }
        }  
        if (isset($materialPercentArray)){
            $product->materials()->sync($materialPercentArray);
        }

        if(isset($data['image_in_base'])){
            $imagesInBase = $data['image_in_base'];
            unset($data['image_in_base']);
        } 

        if(isset($data['product_images'])){
            $productImages = $data['product_images'];
            unset($data['product_images']);
            foreach($productImages as $key => $productImage){
                if(isset($imagesInBase[$key])){
                    $productImageModel = $product->productImages()->where('file_path', $imagesInBase[$key])->first();
                    if (Storage::disk('public')->exists($imagesInBase[$key])){
                        Storage::disk('public')->delete($imagesInBase[$key]);
                    }
                    $filePath['file_path'] = Storage::disk('public')->put('/images', $productImage);
                    $productImageModel->update($filePath);
                } else{
                    $filePath = Storage::disk('public')->put('/images', $productImage);
                    $product->productImages()->create(['file_path' => $filePath]);
                }  
            }
        }  
        
        if (isset($data['seasons'])){
            $seasonIds = $data['seasons'];
            $product->seasons()->sync($seasonIds);
            unset($data['seasons']);
        }else{
            $product->seasons()->detach();
        }

        if (isset($data['tags'])){
            $tagIds = $data['tags'];
            $product->tags()->sync($tagIds);
            unset($data['tags']);
        }else{
            $product->tags()->detach();
        }

        if (isset($data['colors'])){
            $colorIds = $data['colors'];
            $product->colors()->sync($colorIds);
            unset($data['colors']);
        }else{
            $product->tags()->detach();
        }
        
        $product->update($data);

        DB::commit();
        return $product;  
    }

    public function delete($product){
        
        DB::beginTransaction();    
        if (Storage::disk('public')->exists($product->preview_image)){
            Storage::disk('public')->delete($product->preview_image);
        }

        foreach($product->productImages()->get() as $image){
            if (Storage::disk('public')->exists($image->file_path)){
                Storage::disk('public')->delete($image->file_path);
            }
        }
        $product->productImages()->delete(); 
        $product->tags()->detach();
        $product->colors()->detach();
        $product->materials()->detach();
        $product->seasons()->detach();
        $product->countProductsSizes()->detach();
        $product->delete();
        DB::commit();

    }
}
