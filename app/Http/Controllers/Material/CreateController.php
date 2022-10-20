<?php

namespace App\Http\Controllers\Material;

use App\Models\Material;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CreateController extends Controller
{
    public function __invoke(){
        $this->authorize('material-policy', [Material::class]);
        return view('material.create');
    }
}
