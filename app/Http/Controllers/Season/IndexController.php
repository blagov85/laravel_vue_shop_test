<?php

namespace App\Http\Controllers\Season;

use App\Models\Season;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('season-policy', [Season::class]);
        $seasons = Season::all();
        return view('season.index', compact('seasons'));
    }
}
