<?php

namespace App\Http\Controllers\Order;

use App\Models\Order;
use App\Http\Controllers\Order\BaseController;

class DeleteController extends BaseController
{
    public function __invoke(Order $order){
        $this->authorize('order-policy', [Order::class]); 
        try{
            $this->service->delete($order);
        }catch(Exception $exception){
            return back()->withErrors(["order_delete_error" => "Ошибка удаления товара"]);
        }
        return redirect()->route('order.index');
    }
}
