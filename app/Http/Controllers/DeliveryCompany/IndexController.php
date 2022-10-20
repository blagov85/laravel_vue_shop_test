<?php

namespace App\Http\Controllers\DeliveryCompany;

use App\Models\DeliveryCompany;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('delivery-company-policy', [DeliveryCompany::class]);
        $deliveryCompanies = DeliveryCompany::all();
        return view('delivery_company.index', compact('deliveryCompanies'));
    }
}
