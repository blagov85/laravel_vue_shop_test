<?php

namespace App\Http\Controllers\Country;

use App\Models\Country;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Country\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Country $country){
        $this->authorize('country-policy', [Country::class]);
        $data = $request->validated();
        $country->update($data);
        return view('country.show', compact('country'));
    }
}
