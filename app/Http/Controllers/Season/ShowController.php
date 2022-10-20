<?php

namespace App\Http\Controllers\Season;

use App\Models\Season;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ShowController extends Controller
{
    public function __invoke(Season $season){
        $this->authorize('season-policy', [Season::class]);
        return view('season.show', compact('season'));
    }
}
