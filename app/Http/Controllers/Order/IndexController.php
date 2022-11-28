<?php

namespace App\Http\Controllers\Order;

use App\Models\Order;
use App\Http\Requests\Order\IndexRequest;
use App\Http\Controllers\Order\BaseController;

class IndexController extends BaseController
{
    public function __invoke(IndexRequest $request){
        $this->authorize('order-policy', [Order::class]);
        $data = $request->validated();
        
        $result = $this->service->index($data);

        $regions = $result['regions'];
        $companies = $result['companies'];
        $payments = $result['payments'];
        $statuses = $result['statuses'];
        $orders = $result['orders'];
        $dateFrom = $result['dateFrom'];
        $dateTo = $result['dateTo'];
         
        return view('order.index', compact('orders','regions','payments','statuses','companies','data','dateFrom','dateTo'));
    }
}
