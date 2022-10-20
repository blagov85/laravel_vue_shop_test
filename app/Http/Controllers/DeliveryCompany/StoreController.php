<?php

namespace App\Http\Controllers\DeliveryCompany;

use App\Models\DeliveryCompany;
use App\Http\Controllers\Controller;
use App\Http\Requests\DeliveryCompany\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('delivery-company-policy', [DeliveryCompany::class]);
        $data = $request->validated();
        DeliveryCompany::firstOrCreate($data);
        return redirect()->route('delivery_company.index');
    }
}
