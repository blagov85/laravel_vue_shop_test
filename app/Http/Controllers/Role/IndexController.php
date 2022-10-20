<?php

namespace App\Http\Controllers\Role;

use App\Models\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('role-policy', [Role::class]);
        $roles = Role::all();
        return view('role.index', compact('roles'));
    }
}
