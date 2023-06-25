<?php

namespace App\Http\Controllers\Material;

use App\Models\Material;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Material $material){
        $this->authorize('material-delete-policy', [Material::class]);
        $material->delete();
        return redirect()->route('material.index');
    }
}
