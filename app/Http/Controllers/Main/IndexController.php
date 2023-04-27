<?php

namespace App\Http\Controllers\Main;

use App\Models\User;
use App\Models\Order;
use App\Models\Product;
use App\Models\Feedback;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $productsCount = Product::count();
        $ordersCount = Order::count();
        $feedbacksCount = Feedback::whereNull('parent_id')->count();
        $customersCount = User::where('role_id', User::ROLE_CUSTOMER)->count();
        return view('main.index', compact('productsCount', 'ordersCount',
                        'feedbacksCount', 'customersCount'));
    }
}
