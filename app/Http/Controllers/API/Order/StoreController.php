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
        //return $data;
        $products = $data['products'];
        //sort products about id of product
        usort($products, function($a, $b) { //Sort the array using a user defined function
            return $a['id'] < $b['id'] ? -1 : 1; //Compare the scores
        });
        //define id all products and add to array
        foreach($products as $product){
            $ids[] = $product['id'];
        }
        try{
            DB::beginTransaction();
            //find these products and their sizes and counts sizes
            $productsDB = Product::with('countProductsSizes')->whereIn('id', $ids)->get();
            $sizeCountDB = [];
            //check one product
            foreach($productsDB as $key => $productDB){
                //check id from basket and from db
                if($productDB->id === $products[$key]['id']){
                    //price from basket != price from db 
                    if($productDB->price !== $products[$key]['price']){
                        DB::rollback();
                        return response([
                            'message' => 'Проверьте стоимость товаров в заказе'
                        ]);
                    }
                    $size = null;
                    //whether exist size of product in intermediate db 
                    $size = $productDB->countProductsSizes->find($products[$key]['size_id']);
                    if($size == null){
                        DB::rollback();
                        return response([
                            'message' => 'Проверьте наличие товаров'
                        ]);
                    }
                    //get count of size from db
                    $sizeCountDB = $size->pivot->count;
                    //different from count size in db and order
                    $restSize = $sizeCountDB - $products[$key]['qty'];
                    if($restSize > 0){
                        //reduce count of size in intermediate db
                        $productDB->countProductsSizes()->updateExistingPivot($products[$key]['size_id'], 
                            ['count' => $restSize]);
                    }elseif($restSize === 0){
                        //detach link in intermediate db (count size == 0)
                        $productDB->countProductsSizes()->detach($products[$key]['size_id']);
                    }else{
                        DB::rollback();
                        return response([
                            'message' => 'Проверьте наличие товаров в заказе'
                        ]);
                    }
                }
            }
            //user not exists in order
            if($data['user_id'] === null){
                //check whether user exists in db with email
                $user = User::select('id')->where('email',$data['email'])->first();
                if($user){
                    //get this user
                    $data['user_id'] = $user['id'];
                }
                if($data['user_id'] === null){
                    //add new user in db
                    $password = Hash::make('123');
                    $user = User::create([
                        'email' => $data['email'],
                        'name' => $data['name'],
                        'password' => $password,
                        'role_id' => 5
                    ]);
                    $data['user_id'] = $user['id'];  
                }
            }
            $data['products'] = json_encode($data['products']);
            $order = Order::create($data);
            DB::commit(); 
            return new OrderResource($order);       
        }catch(Exception $exception){
            DB::rollback();
            return response([
                'status' => 'failed'
            ], 400);
        }      
    }
}
