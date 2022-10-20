<?php

namespace App\Http\Controllers\Sex;

use App\Models\Sex;
use App\Http\Controllers\Controller;
use App\Http\Requests\Sex\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('sex-policy', [Sex::class]);
        $data = $request->validated();
        Sex::firstOrCreate($data);
        return redirect()->route('sex.index');
    }
}
