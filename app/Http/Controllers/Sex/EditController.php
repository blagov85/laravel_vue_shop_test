<?php

namespace App\Http\Controllers\Sex;

use App\Models\Sex;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EditController extends Controller
{
    public function __invoke(Sex $sex){
        $this->authorize('sex-policy', [Sex::class]);
        return view('sex.edit', compact('sex'));
    }
}
