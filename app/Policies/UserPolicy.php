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
        return auth()->user()->isSuperAdmin() || auth()->user()->isAdmin();
    }
    public function userDeletePolicy()
    {
        return auth()->user()->isSuperAdmin();
    }
    public function userShowEditUpdatePolicy(User $userActive, User $user)
    {
        return (auth()->user()->id == $user->id) || auth()->user()->isSuperAdmin() || auth()->user()->isAdmin();
    }
}
