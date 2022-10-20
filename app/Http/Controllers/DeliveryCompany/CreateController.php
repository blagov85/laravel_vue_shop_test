<?php

namespace App\Http\Controllers\DeliveryCompany;

use App\Models\DeliveryCompany;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CreateController extends Controller
{
    public function __invoke(){
        $this->authorize('delivery-company-policy', [DeliveryCompany::class]);
        return view('delivery_company.create');
    }
}
