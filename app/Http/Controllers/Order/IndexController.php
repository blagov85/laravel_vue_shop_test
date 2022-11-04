<?php

namespace App\Http\Controllers\Order;

use App\Models\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('order-policy', [Order::class]);
        $orders = Order::all();
        return view('order.index', compact('orders'));
    }
}
