<?php

namespace App\Http\Controllers\DeliveryCompany;

use App\Models\DeliveryCompany;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\DeliveryCompany\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, DeliveryCompany $deliveryCompany){
        $this->authorize('delivery-company-policy', [DeliveryCompany::class]);
        $data = $request->validated();
        $deliveryCompany->update($data);
        return view('delivery_company.show', compact('deliveryCompany'));
    }
}
