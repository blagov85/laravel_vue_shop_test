<?php

namespace App\Http\Controllers\API\Order;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Order\OrderResource;

class ShowController extends Controller
{
    public function __invoke(Order $order){
        $order->products = json_decode($order->products);
        foreach($order->products as $product){
            $product->img = Product::find($product->id)->imageUrl;
        }
        return new OrderResource($order);
    }
}
