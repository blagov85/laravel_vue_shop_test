<?php

namespace App\Http\Controllers\DeliveryCompany;

use App\Models\DeliveryCompany;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(DeliveryCompany $deliveryCompany){
        $this->authorize('delivery-company-delete-policy', [DeliveryCompany::class]);
        $deliveryCompany->delete();
        return redirect()->route('delivery_company.index');
    }
}
