<?php

namespace App\Http\Controllers\Sex;

use App\Models\Sex;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Sex\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Sex $sex){
        $this->authorize('Sex-policy', [Sex::class]);
        $data = $request->validated();
        $sex->update($data);
        return view('sex.show', compact('sex'));
    }
}
