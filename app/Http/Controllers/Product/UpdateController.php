<?php

namespace App\Http\Controllers\Product;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Product\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Product $product){
        $this->authorize('product-policy', [Product::class]);
        $data = $request->validated();
        try{
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
        }catch(Exception $exception){
            DB::rollback();
            abort(500);
        }
        return redirect()->route('product.show', compact('product'));
    }
}
