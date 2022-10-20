<?php

namespace App\Http\Controllers\Size;

use App\Models\Size;
use App\Http\Controllers\Controller;
use App\Http\Requests\Size\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('size-policy', [Size::class]);
        $data = $request->validated();
        Size::firstOrCreate($data);
        return redirect()->route('size.index');
    }
}
