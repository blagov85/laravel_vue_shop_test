<?php

namespace App\Http\Controllers\API\User;

use app;
use App\Models\Region;
use App\Http\Controllers\Controller;
use App\Http\Resources\User\IndexRegionResource;


class IndexRegionController extends Controller
{
    public function __invoke(){
        $regions = Region::all();
        return IndexRegionResource::collection($regions);
    }
}
