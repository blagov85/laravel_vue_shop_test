<?php

namespace App\Http\Controllers\Order;

use App\Models\Order;
use App\Http\Controllers\Order\BaseController;

class EditController extends BaseController
{
    public function __invoke(Order $order){
        $this->authorize('order-policy', [Order::class]);
        
        $result = $this->service->edit($order);
        
        $regions = $result['regions'];
        $companies = $result['companies'];
        $payments = $result['payments'];
        $statuses = $result['statuses'];
        $orders = $result['orders'];

        return view('order.edit', compact('order','regions','payments','statuses','companies'));
    }
}
