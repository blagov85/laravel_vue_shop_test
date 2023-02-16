<?php

namespace App\Http\Controllers\API\Order;

use Exception;
use App\Http\Resources\Order\OrderResource;
use App\Http\Requests\API\Order\StoreRequest;
use App\Http\Controllers\API\Order\BaseController;

class StoreController extends BaseController
{
    public function __invoke(StoreRequest $request){
        
        $data = $request->validated();
        try{
            $order = $this->service->store($data);
            return new OrderResource($order);       
        }catch(Exception $exception){
            return response([
                'error' => $exception->getMessage()
            ], 422);
        }      
    }
}
