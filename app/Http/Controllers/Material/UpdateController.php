<?php

namespace App\Http\Controllers\Material;

use App\Models\Material;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Material\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Material $material){
        $this->authorize('material-policy', [Material::class]);
        $data = $request->validated();
        $material->update($data);
        return view('material.show', compact('material'));
    }
}
