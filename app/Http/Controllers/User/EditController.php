<?php

namespace App\Http\Controllers\User;

use Carbon\Carbon;
use App\Models\Role;
use App\Models\User;
use App\Models\Region;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EditController extends Controller
{
    public function __invoke(User $user){
        $this->authorize('user-show-edit-update-policy', $user);
        $roles = Role::all();
        $regions = Region::all();
        if($user->birth_date)
            $user->birth_date = Carbon::createFromFormat('Y-m-d', $user->birth_date)->format('d/m/Y');
        return view('user.edit', compact('user', 'roles', 'regions'));
    }
}
