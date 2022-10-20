<?php

namespace App\Http\Controllers\User;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(User $user){
        $this->authorize('user-policy', [User::class]);
        $user->delete();
        return redirect()->route('user.index');
    }
}
