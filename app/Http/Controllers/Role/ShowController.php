<?php

namespace App\Http\Controllers\Role;

use App\Models\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ShowController extends Controller
{
    public function __invoke(Role $role){
        $this->authorize('role-policy', [Role::class]);
        return view('role.show', compact('role'));
    }
}
