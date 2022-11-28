<?php

namespace App\Http\Controllers\Order;

use App\Models\Order;
use App\Http\Controllers\Order\BaseController;

class ShowController extends BaseController
{
    public function __invoke(Order $order){
        $this->authorize('order-policy', [Order::class]);

        $result = $this->service->show($order);

        $orders = $result['orders'];
        $payments = $result['payments'];
        $statuses = $result['statuses'];

        return view('order.show', compact('order','statuses','payments'));
    }
}
