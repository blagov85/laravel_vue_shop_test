<?php

namespace App\Http\Controllers\Sex;

use App\Models\Sex;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('sex-policy', [Sex::class]);
        $sex = Sex::all();
        return view('sex.index', compact('sex'));
    }
}
