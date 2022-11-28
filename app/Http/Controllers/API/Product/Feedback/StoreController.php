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
        }catch(Exception $exception){
            DB::rollback();
            abort(500);
        }
        return "OK";
    }
}
