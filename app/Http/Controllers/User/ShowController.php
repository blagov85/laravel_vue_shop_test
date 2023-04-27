<?php

namespace App\Http\Controllers\User;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ShowController extends Controller
{
    public function __invoke(User $user){
        $this->authorize('user-show-edit-update-policy', $user);
        return view('user.show', compact('user'));
    }
}
