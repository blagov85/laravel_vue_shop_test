<?php

namespace App\Http\Controllers\Group;

use App\Models\Group;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CreateController extends Controller
{
    public function __invoke(){
        $this->authorize('group-policy', [Group::class]);
        return view('group.create');
    }
}
