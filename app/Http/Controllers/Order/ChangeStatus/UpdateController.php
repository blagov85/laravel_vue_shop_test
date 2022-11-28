<?php

namespace App\Http\Controllers\Order\ChangeStatus;

use Exception;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Requests\Order\ChangeStatus\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Order $order){
        $this->authorize('order-policy', [Order::class]);
        $data = $request->validated();
        $order->update($data);
        return redirect()->route('order.index');
         
        
    }
}
