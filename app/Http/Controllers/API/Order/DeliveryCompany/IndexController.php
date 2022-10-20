<?php

namespace App\Http\Controllers\API\Order\DeliveryCompany;

use app;
use App\Models\DeliveryCompany;
use App\Http\Controllers\Controller;
use App\Http\Resources\DeliveryCompany\DeliveryCompanyResource;


class IndexController extends Controller
{
    public function __invoke(){
        $deliveryCompanies = DeliveryCompany::all();
        return DeliveryCompanyResource::collection($deliveryCompanies);
    }
}
