<?php

namespace App\Http\Controllers\Color;

use App\Models\Color;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Color\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Color $color){
        $this->authorize('color-policy', [Color::class]);
        $data = $request->validated();
        $color->update($data);
        return view('color.show', compact('color'));
    }
}
