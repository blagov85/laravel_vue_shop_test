<?php

namespace App\Http\Controllers\API\Order;


use app;
use App\Models\User;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
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
        $products = $data['products'];
        usort($products, function($a, $b) { //Sort the array using a user defined function
            return $a['id'] < $b['id'] ? -1 : 1; //Compare the scores
        });
        foreach($products as $product){
            $ids[] = $product['id'];
        }
        try{
            DB::beginTransaction();
            $productsDB = Product::with('countProductsSizes')->whereIn('id', $ids)->get();
            $sizeCountDB = [];
            foreach($productsDB as $key => $productDB){
                if($productDB->id === $products[$key]['id']){
                    if($productDB->price !== $products[$key]['price']){
                        DB::rollback();
                        return response([
                            'message' => 'Проверьте стоимость товаров в заказе'
                        ]);
                    }
                    $size = $productDB->countProductsSizes->find($products[$key]['size_id']);
                    $sizeCountDB = $size->pivot->count;
                    $restSize = $sizeCountDB - $products[$key]['qty'];
                    if($restSize > 0){
                        $productDB->countProductsSizes()->updateExistingPivot($products[$key]['size_id'], 
                            ['count' => $restSize]);
                    }elseif($restSize === 0){
                        $productDB->countProductsSizes()->detach($products[$key]['size_id']);
                    }else{
                        DB::rollback();
                        return response([
                            'message' => 'Проверьте наличие товаров в заказе'
                        ]);
                    }
                }
            }
            DB::commit();        
        }catch(Exception $exception){
            DB::rollback();
            return response([
                'status' => 'failed'
            ], 400);
        }
        return $productsDB;
        // $password = Hash::make('123');
        // $user = User::firstOrCreate([
        //     'email' => $data['email']
        // ],[
        //     'name' => $data['name'],
        //     'address' => $data['address'],
        //     'password' => $password
        // ]);

        // $order = Order::create([
        //     'products' => json_encode($data['products']),
        //     'user_id' => $user->id,
        //     'total_price' => $data['total_price']
        // ]);

        // return new OrderResource($order);

    }
}
