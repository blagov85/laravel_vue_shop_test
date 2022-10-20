<?php

namespace App\Http\Controllers\Country;

use App\Models\Country;
use App\Http\Controllers\Controller;
use App\Http\Requests\Country\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('country-policy', [Country::class]);
        $data = $request->validated();
        Country::firstOrCreate($data);
        return redirect()->route('country.index');
    }
}
