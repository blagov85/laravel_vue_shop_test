<?php

namespace App\Http\Controllers\Brand;

use App\Models\Brand;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Brand\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Brand $brand){
        $this->authorize('brand-policy', [Brand::class]);
        $data = $request->validated();
        $brand->update($data);
        return view('brand.show', compact('brand'));
    }
}
