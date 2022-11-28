<?php

namespace App\Http\Controllers\Order\AddProduct;

use Exception;
use App\Models\Order;
use App\Http\Requests\Order\AddProduct\UpdateRequest;
use App\Http\Controllers\Order\AddProduct\BaseController;

class UpdateController extends BaseController
{
    public function __invoke(UpdateRequest $request, Order $order){
        $this->authorize('order-policy', [Order::class]);
        $data = $request->validated();
        try{
            $order = $this->service->update($order, $data);
        }catch(Exception $exception){
            return back()->withErrors(["product_add_error" => $exception->getMessage()]); 
        }
        return redirect()->route('order.edit', compact('order'));  
    }
}
