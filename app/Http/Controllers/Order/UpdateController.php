<?php

namespace App\Http\Controllers\Order;

use App\Models\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Order\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Order $order){
        $this->authorize('order-policy', [Order::class]);
        $data = $request->validated();
        $order->update($data);
        return view('order.show', compact('order'));
    }
}
