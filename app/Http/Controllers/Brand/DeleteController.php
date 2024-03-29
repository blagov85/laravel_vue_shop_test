<?php

namespace App\Http\Controllers\Brand;

use App\Models\Brand;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Brand $brand){
        $this->authorize('brand-delete-policy', [Brand::class]);
        $brand->delete();
        return redirect()->route('brand.index');
    }
}
