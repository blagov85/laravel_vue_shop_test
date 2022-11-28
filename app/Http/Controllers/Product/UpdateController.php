<?php

namespace App\Http\Controllers\Product;

use App\Models\Product;
use App\Http\Controllers\Product\BaseController;
use App\Http\Requests\Product\UpdateRequest;

class UpdateController extends BaseController
{
    public function __invoke(UpdateRequest $request, Product $product){
        $this->authorize('product-policy', [Product::class]);
        $data = $request->validated();
        try{
            $product = $this->service->update($product, $data);
        }catch(Exception $exception){
            DB::rollback();
            return back()->withErrors(["product_update_error" => "Ошибка редактирования продукта"]);
        }
        return redirect()->route('product.show', compact('product'));
    }
}
