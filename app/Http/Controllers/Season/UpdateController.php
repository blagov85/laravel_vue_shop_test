<?php

namespace App\Http\Controllers\Season;

use App\Models\Season;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Season\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Season $season){
        $this->authorize('season-policy', [Season::class]);
        $data = $request->validated();
        $season->update($data);
        return view('season.show', compact('season'));
    }
}
