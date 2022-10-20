<?php

namespace App\Http\Controllers\Size;

use App\Models\Size;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('size-policy', [Size::class]);
        $sizes = Size::all();
        return view('size.index', compact('sizes'));
    }
}
