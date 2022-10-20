<?php

namespace App\Http\Controllers\Role;

use App\Models\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CreateController extends Controller
{
    public function __invoke(){
        $this->authorize('role-policy', [Role::class]);
        return view('role.create');
    }
}
