<?php

namespace App\Http\Controllers\Material;

use App\Models\Material;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EditController extends Controller
{
    public function __invoke(Material $material){
        $this->authorize('material-policy', [Material::class]);
        return view('material.edit', compact('material'));
    }
}
