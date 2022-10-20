<?php

namespace App\Http\Controllers\Material;

use App\Models\Material;
use App\Http\Controllers\Controller;
use App\Http\Requests\Material\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('material-policy', [Material::class]);
        $data = $request->validated();
        Material::firstOrCreate($data);
        return redirect()->route('material.index');
    }
}
