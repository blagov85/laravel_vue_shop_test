<?php

namespace App\Http\Controllers\Season;

use App\Models\Season;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CreateController extends Controller
{
    public function __invoke(){
        $this->authorize('season-policy', [Season::class]);
        return view('season.create');
    }
}
