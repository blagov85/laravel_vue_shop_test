<?php

namespace App\Http\Controllers\Size;

use App\Models\Size;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ShowController extends Controller
{
    public function __invoke(Size $size){
        $this->authorize('size-policy', [Size::class]);
        return view('size.show', compact('size'));
    }
}
