<?php

namespace App\Http\Controllers\Color;

use App\Models\Color;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Color $color){
        $this->authorize('color-policy', [Color::class]);
        $color->delete();
        return redirect()->route('color.index');
    }
}
