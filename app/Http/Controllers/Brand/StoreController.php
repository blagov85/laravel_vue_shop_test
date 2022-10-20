<?php

namespace App\Http\Controllers\Brand;

use App\Models\Brand;
use App\Http\Controllers\Controller;
use App\Http\Requests\Brand\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('brand-policy', [Brand::class]);
        $data = $request->validated();
        Brand::firstOrCreate($data);
        return redirect()->route('brand.index');
    }
}
