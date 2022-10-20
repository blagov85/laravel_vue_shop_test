<?php

namespace App\Http\Controllers\Sex;

use App\Models\Sex;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CreateController extends Controller
{
    public function __invoke(){
        $this->authorize('sex-policy', [Sex::class]);
        return view('sex.create');
    }
}
