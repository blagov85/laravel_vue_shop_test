<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class MaterialPolicy
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

    public function materialPolicy()
    {
        return auth()->user()->isSuperAdmin() || auth()->user()->isAdmin() || auth()->user()->isWriter();
    }

    public function materialDeletePolicy()
    {
        return auth()->user()->isSuperAdmin();
    }
}
