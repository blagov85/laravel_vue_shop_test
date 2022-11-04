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
            $product->img = Product::find($product->id)->imageUrl;
        }
        $regions = Region::get();
        $payments = Payment::get();
        $statuses = OrderStatus::get();
        $companies = DeliveryCompany::get();
        return view('order.edit', compact('order','regions','payments','statuses','companies'));
    }
}
