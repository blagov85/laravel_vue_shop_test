<?php

namespace App\Http\Controllers\Product;

use App\Models\Product;
use App\Http\Controllers\Product\BaseController;

class DeleteController extends BaseController
{
    public function __invoke(Product $product){
        $this->authorize('product-delete-policy', [Product::class]);
        try{
            $this->service->delete($product);
        }catch(Exception $exception){
            DB::rollback();
            return back()->withErrors(["product_delete_error" => "Ошибка удаления продукта"]);
        }
        return redirect()->route('product.index');
    }
}
