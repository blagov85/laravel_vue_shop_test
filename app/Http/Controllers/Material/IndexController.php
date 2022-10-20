<?php

namespace App\Http\Controllers\Material;

use App\Models\Material;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('material-policy', [Material::class]);
        $materials = Material::all();
        return view('material.index', compact('materials'));
    }
}
