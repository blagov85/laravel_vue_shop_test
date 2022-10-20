<?php

namespace App\Http\Controllers\DeliveryCompany;

use App\Models\DeliveryCompany;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ShowController extends Controller
{
    public function __invoke(DeliveryCompany $deliveryCompany){
        $this->authorize('delivery-company-policy', [DeliveryCompany::class]);
        return view('delivery_company.show', compact('deliveryCompany'));
    }
}
