<?php

namespace App\Http\Controllers\Season;

use App\Models\Season;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EditController extends Controller
{
    public function __invoke(Season $season){
        $this->authorize('season-policy', [Season::class]);
        return view('season.edit', compact('season'));
    }
}
