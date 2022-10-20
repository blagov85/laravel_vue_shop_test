<?php

namespace App\Http\Controllers\Size;

use App\Models\Size;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Size\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Size $size){
        $this->authorize('size-policy', [Size::class]);
        $data = $request->validated();
        $size->update($data);
        return view('size.show', compact('size'));
    }
}
