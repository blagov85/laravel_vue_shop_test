<?php

namespace App\Http\Controllers\Color;

use App\Models\Color;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EditController extends Controller
{
    public function __invoke(Color $color){
        $this->authorize('color-policy', [Color::class]);
        return view('color.edit', compact('color'));
    }
}
