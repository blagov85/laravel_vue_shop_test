<?php

namespace App\Http\Controllers\Order\AddProduct;

use App\Http\Controllers\Controller;
use App\Services\Order\AddProduct\AddProductService;

class BaseController extends Controller
{
    public $service;

    public function __construct(AddProductService $service){
        $this->service = $service;
    }

}
