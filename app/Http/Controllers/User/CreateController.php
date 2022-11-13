<?php

namespace App\Http\Controllers\User;

use App\Models\Role;
use App\Models\User;
use App\Models\Region;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CreateController extends Controller
{
    public function __invoke(){
        $this->authorize('user-policy', [User::class]);
        $this->middleware('can:admin-panel');
        $roles = Role::all();
        $regions = Region::all();
        return view('user.create', compact('roles','regions'));
    }
}
