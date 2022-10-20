<?php

namespace App\Http\Controllers\API\Order;


use app;
use App\Models\User;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Http\Filters\ProductFilter;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\Order\OrderResource;
use App\Http\Requests\API\Order\StoreRequest;
use App\Http\Resources\Product\IndexProductResource;


class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $data = $request->validated();

        $password = Hash::make('123');
        $user = User::firstOrCreate([
            'email' => $data['email']
        ],[
            'name' => $data['name'],
            'address' => $data['address'],
            'password' => $password
        ]);

        $order = Order::create([
            'products' => json_encode($data['products']),
            'user_id' => $user->id,
            'total_price' => $data['total_price']
        ]);

        return new OrderResource($order);

    }
}
