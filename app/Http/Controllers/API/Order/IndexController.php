<?php

namespace App\Http\Controllers\API\Order;

use app;
use App\Models\Order;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\Order\OrderMinResource;



class IndexController extends Controller
{
    public function __invoke(){
        $orders = Auth::user()->orders;
        return OrderMinResource::collection($orders);
    }
}
