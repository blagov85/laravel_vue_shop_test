<?php

namespace App\Http\Controllers\Order\AddProduct;

use App\Models\Size;
use App\Models\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EditController extends Controller
{
    public function __invoke(Order $order){
        $this->authorize('order-policy', [Order::class]);
        $sizes = Size::all();
        return view('order.add_product_edit', compact('order','sizes'));
    }
}
