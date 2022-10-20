<?php

namespace App\Http\Controllers\Brand;

use App\Models\Brand;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EditController extends Controller
{
    public function __invoke(Brand $brand){
        $this->authorize('brand-policy', [Brand::class]);
        return view('brand.edit', compact('brand'));
    }
}
