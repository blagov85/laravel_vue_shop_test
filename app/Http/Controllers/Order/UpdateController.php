<?php

namespace App\Http\Controllers\Order;

use Exception;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Http\Requests\Order\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Order $order){
        $this->authorize('order-policy', [Order::class]);
        $data = $request->validated();
        $productsDelete = null;
        //data about products from form (id products and id_size products)
        $idsProdIdsSizeForm = $data["idsProdIdsSizeForm"];
        //data about qtys products from form
        $qtysForm = $data["qtys"];
        if(isset($data['productsDelete'])){
            //data about products for delete
            $productsDelete = $data["productsDelete"];
            //delete data from request
            unset($data['productsDelete']);
        }
        //delete data from request
        unset($data['idsProdIdsSizeForm']);
        unset($data['qtys']);
        //get data of products for order from db
        $orderProducts = json_decode($order->products);
        
        //products for delete from order exist
        try{
            DB::beginTransaction();
            if($productsDelete){
                //count products for delete = count products in order
                if(count($productsDelete) === count($orderProducts)){
                    DB::rollback();
                    return back()->withErrors(["count_products_delete" => "Нельзя удалить все товары в заказе"]); 
                }
                //each product in order from db
                $t=0;
                foreach($orderProducts as $key => $orderProduct){
                    //template for check with data products for delete from order
                    $templateCheck = $orderProduct->id.':'.$orderProduct->size_id;
                    //product in order exists for delete
                    if(in_array($templateCheck, $productsDelete)){
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
                        //delete product from array of products in order
                        unset($orderProducts[$key]);
                        //delete product from array of products for delete
                        unset($idsProdIdsSizeForm[$key]);
                        //delete qty of product from array of qtys products in form
                        unset($qtysForm[$key]);
                    }
                }
            }
            //dd($orderProducts);
            $orderProducts = array_values($orderProducts);
            $idsProdIdsSizeForm = array_values($idsProdIdsSizeForm);
            $qtysForm = array_values($qtysForm);
            //dd($orderProducts);
            //sum of order
            $total_price = 0;
            //each product in order from db
            foreach($orderProducts as $key => $orderProduct){
                //get product from db from id product in order
                $templateCheck = $orderProduct->id.':'.$orderProduct->size_id;
                //product in order exists in array from form
                if($templateCheck === $idsProdIdsSizeForm[$key]){
                    //$t++;
                    //qty of product in order != qty of product in form (change qty)
                    if($orderProduct->qty !== $qtysForm[$key]){
                        //get product from db from id product in order
                        $product = Product::find($orderProduct->id);
                        $size = null;
                        //define size of product
                        $size = $product->countProductsSizes->find($orderProduct->size_id);
                        //qty of product from order > qty of product in form
                        if($orderProduct->qty > $qtysForm[$key]){
                            //different qty in product in order and product from form
                            $differNum = $orderProduct->qty - $qtysForm[$key];
                            //size exists in db
                            if($size){
                                //different qty in order and form + count in db 
                                $count = $size->pivot->count + $differNum;
                                //write sum size in pivot db
                                $product->countProductsSizes()->updateExistingPivot($orderProduct->size_id, 
                                             ['count' => $count]);
                            }else{//size not exists in db
                                //add link in intermediate db
                                $product->countProductsSizes()->attach($orderProduct->size_id, ['count'=>$differNum]);
                            }
                            //qty of product from order < qty of product in form
                        }elseif($orderProduct->qty < $qtysForm[$key]){
                            //different qty in product in order and product from form
                            $differNum = $qtysForm[$key] - $orderProduct->qty;
                            //different qty in order and form + count in db 
                            $count = $size->pivot->count - $differNum;
                            //link does not exist or count < 0
                            if(($size == null) || ($count < 0)){
                                DB::rollback();
                                return back()->withErrors(["count_product" => "Количество товара не достаточно в наличии"]);
                            }
                            if($count === 0){
                                //add link in intermediate db
                                $product->countProductsSizes()->detach($orderProduct->size_id);
                            }else{
                                //write different size in pivot db
                                $product->countProductsSizes()->updateExistingPivot($orderProduct->size_id, 
                                            ['count' => $count]);
                            }
                        }
                        //write in product->qty qty from form 
                        $orderProduct->qty = $qtysForm[$key];
                        //count whole sum of order
                    }
                    $total_price += $orderProduct->qty * $orderProduct->price;
                }
            }
            //dd($orderProducts);
            //write total_price in request
            $data['total_price'] = $total_price;
            //write products in request
            $data['products'] = json_encode($orderProducts);
            $order->update($data);
            DB::commit();
            return redirect()->route('order.show', compact('order'));
        }catch(Exception $exception){
            DB::rollback();
            return back();
        }  
        
    }
}
