<?php

namespace App\Http\Controllers\Product;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;

class DeleteController extends Controller
{
    public function __invoke(Product $product){
        $this->authorize('product-policy', [Product::class]);
        try{
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
        }catch(Exception $exception){
            DB::rollback();
            abort(500);
        }
        return redirect()->route('product.index');
    }
}
