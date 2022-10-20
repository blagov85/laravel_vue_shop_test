<?php

namespace App\Http\Controllers\Season;

use App\Models\Season;
use App\Http\Controllers\Controller;
use App\Http\Requests\Season\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('season-policy', [Season::class]);
        $data = $request->validated();
        Season::firstOrCreate($data);
        return redirect()->route('season.index');
    }
}
