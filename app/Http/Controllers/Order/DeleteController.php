<?php

namespace App\Http\Controllers\Order;

use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Order $order){
        $this->authorize('order-policy', [Order::class]);
        
        $orderProducts = Order::find($order->id)->products;
        $orderProducts = json_decode($orderProducts);
        try{
            DB::beginTransaction();
            foreach($orderProducts as $orderProduct){
                //get product from db from id product in order
                $product = Product::find($orderProduct->id);
                $size = null;
                //define size of product
                $size = $product->countProductsSizes->find($orderProduct->size_id);
                //size exists in db
                if($size){
                    //count in order and + count in db 
                    $count = $orderProduct->qty + $size->pivot->count;
                    //write sum size in pivot db
                    $product->countProductsSizes()->updateExistingPivot($orderProduct->size_id, 
                                ['count' => $count]);
                }else{//size not exists in db
                    //add link in intermediate db
                    $product->countProductsSizes()->attach($orderProduct->size_id, ['count'=>$orderProduct->qty]);
                }
            }
            $order->delete();
            DB::commit();
        }catch(Exception $exception){
            DB::rollback();
            return response([
                'status' => 'failed'
            ], 400);
        } 
        return redirect()->route('order.index');
    }
}
