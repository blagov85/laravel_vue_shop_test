<?php

namespace App\Http\Controllers\Order;

use App\Models\Order;
use App\Models\Region;
use App\Models\Product;
use App\Models\OrderStatus;
use App\Models\Payment;
use Illuminate\Http\Request;
use App\Models\DeliveryCompany;
use App\Http\Controllers\Controller;

class EditController extends Controller
{
    public function __invoke(Order $order){
        $this->authorize('order-policy', [Order::class]);
        $order->products = json_decode($order->products);
        foreach($order->products as $product){
            $size = null;
            $prod = Product::find($product->id);
            $product->img = $prod->imageUrl;
            $size = $prod->countProductsSizes->find($product->size_id);
            if($size){
                $product->countSize = $size->pivot->count;
            }else{
                $product->countSize = 0;
            }
        }
        $regions = Region::get();
        $payments = Payment::get();
        $statuses = OrderStatus::get();
        $companies = DeliveryCompany::get();
        return view('order.edit', compact('order','regions','payments','statuses','companies'));
    }
}
