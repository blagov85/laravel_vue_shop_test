<?php

namespace App\Http\Controllers\Order;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ShowController extends Controller
{
    public function __invoke(Order $order){
        $this->authorize('order-policy', [Order::class]);
        $order->products = json_decode($order->products);
        foreach($order->products as $product){
            $product->img = Product::find($product->id)->imageUrl;
        }
        return view('order.show', compact('order'));
    }
}
