<?php

namespace App\Http\Controllers\Product;

use Exception;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Http\Requests\Product\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        
        $this->authorize('product-policy', [Product::class]);
        $data = $request->validated();

        try{
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
      
            // ProductImage::create([
            //     'product_id' => $product_id,
            //     'file_path' => $filePath
            // ]);
            
            DB::commit();
        }catch(Exception $exception){
            DB::rollback();
            abort(500);
        }
        return redirect()->route('product.index');
    }
}
