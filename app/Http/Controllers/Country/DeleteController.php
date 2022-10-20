<?php

namespace App\Http\Controllers\Country;

use App\Models\Country;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Country $country){
        $this->authorize('country-policy', [Country::class]);
        $country->delete();
        return redirect()->route('country.index');
    }
}
