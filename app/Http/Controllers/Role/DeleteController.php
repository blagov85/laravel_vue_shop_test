<?php

namespace App\Http\Controllers\Role;

use App\Models\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Role $role){
        $this->authorize('role-policy', [Role::class]);
        $role->delete();
        return redirect()->route('role.index');
    }
}
