<?php

namespace App\Http\Controllers\Order;

use Exception;
use App\Models\Order;
use App\Http\Controllers\Order\BaseController;
use App\Http\Requests\Order\UpdateRequest;

class UpdateController extends BaseController
{
    public function __invoke(UpdateRequest $request, Order $order){
        $this->authorize('order-policy', [Order::class]);
        $data = $request->validated();
        try{
            $order = $this->service->update($order, $data);
        }catch(Exception $exception){
            return back()->withErrors(["order_update_error" => $exception->getMessage()]);
        }
        return redirect()->route('order.show', compact('order'));
        
        
    }
}
