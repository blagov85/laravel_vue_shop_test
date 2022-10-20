<?php

namespace App\Http\Controllers\Brand;

use App\Models\Brand;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('brand-policy', [Brand::class]);
        $brands = Brand::all();
        return view('brand.index', compact('brands'));
    }
}
