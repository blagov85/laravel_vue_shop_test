<?php

namespace App\Http\Controllers\User;

use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EditController extends Controller
{
    public function __invoke(User $user){
        $this->authorize('user-policy', [User::class]);
        $roles = Role::all();
        return view('user.edit', compact('user', 'roles'));
    }
}
