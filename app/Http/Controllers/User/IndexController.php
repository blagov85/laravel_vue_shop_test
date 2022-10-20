<?php

namespace App\Http\Controllers\User;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('user-policy', [User::class]);
        $users = User::all();
        return view('user.index', compact('users'));
    }
}
