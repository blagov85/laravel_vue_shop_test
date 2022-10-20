<?php

namespace App\Http\Controllers\Color;

use App\Models\Color;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('color-policy', [Color::class]);
        $colors = Color::all();
        return view('color.index', compact('colors'));
    }
}
