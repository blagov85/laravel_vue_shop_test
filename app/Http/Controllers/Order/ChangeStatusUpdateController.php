<?php

namespace App\Http\Controllers\Order;

use Exception;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Requests\Order\ChangeStatusUpdateRequest;

class ChangeStatusUpdateController extends Controller
{
    public function __invoke(ChangeStatusUpdateRequest $request, Order $order){
        $this->authorize('order-policy', [Order::class]);
        $data = $request->validated();
        $order->update($data);
        return redirect()->route('order.index');
         
        
    }
}
