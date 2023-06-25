<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class GroupPolicy
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

    public function groupPolicy()
    {
        return auth()->user()->isSuperAdmin() || auth()->user()->isAdmin() || auth()->user()->isWriter();
    }

    public function groupDeletePolicy()
    {
        return auth()->user()->isSuperAdmin();
    }
}
