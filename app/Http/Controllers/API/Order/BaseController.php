<?php

namespace App\Http\Controllers\API\Order;

use App\Http\Controllers\Controller;
use App\Services\API\Order\OrderService;

class BaseController extends Controller
{
    public $service;

    public function __construct(OrderService $service){
        $this->service = $service;
    }

}
