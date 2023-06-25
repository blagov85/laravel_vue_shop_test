<?php

namespace App\Http\Controllers\Season;

use App\Models\Season;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Season $season){
        $this->authorize('season-delete-policy', [Season::class]);
        $season->delete();
        return redirect()->route('season.index');
    }
}
