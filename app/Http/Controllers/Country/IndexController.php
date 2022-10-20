<?php

namespace App\Http\Controllers\Country;

use App\Models\Country;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('country-policy', [Country::class]);
        $countries = Country::all();
        return view('country.index', compact('countries'));
    }
}
