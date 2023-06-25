<?php

namespace App\Http\Controllers\API\Product\Feedback;

use app;
//use auth;
use App\Models\User;
use App\Models\Product;
use App\Models\Feedback;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\API\Product\Feedback\StoreRequest;



class StoreController extends Controller
{
    public function __invoke(StoreRequest $request, Product $product){
        $data = $request->validated();
        try{
            DB::beginTransaction();
            $data['product_id'] = $product->id;
            $data['user_id'] = Auth::user()->id;
            Feedback::create($data);
            DB::commit();
            if($data['parent_id'] == null){
                return response([
                    'answer' => 'Дякуємо! Ваш відгук буде опубліковано після перевірки!'
                ], 200);
            }
            return response([
                'answer' => 'Дякуємо! Ваша відповідь на відгук буде опублікована після перевірки!'
            ], 200);
        }catch(Exception $exception){
            DB::rollback();
            return response([
                'error' => 'Помилка додавання відгуку або відповіді на відгук!'
            ], 500);
        }
    }
}
