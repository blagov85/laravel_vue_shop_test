<?php

namespace App\Http\Controllers\Order;

use App\Models\Order;
use App\Http\Controllers\Controller;
use App\Http\Requests\Order\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('order-policy', [Order::class]);
        $data = $request->validated();
        Order::firstOrCreate($data);
        return redirect()->route('order.index');
    }
}
