<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class OrderPolicy
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

    public function orderPolicy()
    {
        return auth()->user()->isSuperAdmin() || auth()->user()->isAdmin() || auth()->user()->isManager();
    }
}
