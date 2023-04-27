<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class UserPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function userPolicy()
    {
        return auth()->user()->isAdmin();
    }
    public function userShowEditUpdatePolicy(User $userActive, User $user)
    {
        return ((auth()->user()->id == $user->id) || auth()->user()->isAdmin());
    }
}
