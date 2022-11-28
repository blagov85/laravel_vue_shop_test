<?php

namespace App\Http\Controllers\Product;

use App\Http\Controllers\Product\BaseController;
use App\Http\Requests\Product\StoreRequest;

class StoreController extends BaseController
{
    public function __invoke(StoreRequest $request){
        
        $this->authorize('product-policy', [Product::class]);
        $data = $request->validated();
        try{
            $this->service->store($data);
        }catch(Exception $exception){
            DB::rollback();
            return back()->withErrors(["product_add_error" => "Ошибка добавления продукта"]);
        }
        
        return redirect()->route('product.index');
    }
}
