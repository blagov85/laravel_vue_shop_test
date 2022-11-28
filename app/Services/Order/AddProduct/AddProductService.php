<?php

namespace App\Services\Order\AddProduct;

use Exception;
use App\Models\Order;
use App\Models\Product;
use Illuminate\Support\Facades\DB;

class AddProductService
{
    public function update($order, $data){
        //get data from request
        $id = (int) $data['id_product'];
        $size_id = (int) $data['size_id'];
        $count_product = (int) $data['count_product'];
        //get product from db for add to order
        DB::beginTransaction();
        $product = Product::find($id);
        //product is not in db
        if($product == null){
            DB::rollback();
            throw new Exception("Продукт с id ".$id." не найден");
        }
        //get size from db about link from product
        $size = $product->countProductsSizes->find($size_id);
        
        //size is not exists for product
        if($size == null){
            DB::rollback();
            throw new Exception("Размер товара отсутствует");
        }
        //get count of size from db
        $sizeCountDB = $size->pivot->count;
        //count size in db < count size from form
        if($sizeCountDB < $count_product){
            DB::rollback();
            throw new Exception("Количество товара данного размера недостаточно. Всего в наличии: ".$sizeCountDB);
        }
        //get products from order
        $productsDB = json_decode($order->products);
        foreach($productsDB as $productDB){
            //id and size_id of product for add exists in order
            if(($productDB->id == $id) && ($productDB->size_id == $size_id)){
                DB::rollback();
                throw new Exception("Товар с таким размером существует в заказе");
            }
        }
        //data about product for add
        $productAdd = [];
        $productAdd['id'] = $id;
        $productAdd['title'] = $product->title;
        $productAdd['price'] = $product->price;
        $productAdd['size_id'] = $size_id;
        $productAdd['size_title'] = $size->title;
        $productAdd['qty'] = $count_product;
        //add product to array of products for order
        array_push($productsDB, $productAdd);
        $productAdd= [];
        $productAdd["products"] = json_encode($productsDB);
        $productAdd["total_price"] = $order->total_price + $product->price * $count_product;
        //update order in db
        $order->update($productAdd);
        //difference in db after add prduct to order
        $diff = $sizeCountDB - $count_product;
        //difference = 0
        if($diff == 0){
            //delete link in intermediate db
            $product->countProductsSizes()->detach($size_id);
        }elseif($diff > 0){
            //write different size in pivot db
            $product->countProductsSizes()->updateExistingPivot($size_id, 
            ['count' => $diff]);
        }
        DB::commit();
        return $order;
    }
}
