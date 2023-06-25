<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class ProductPolicy
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

    public function productPolicy()
    {
        return auth()->user()->isSuperAdmin() || auth()->user()->isAdmin() || auth()->user()->isWriter() || auth()->user()->isManager();
    }

    public function productDeletePolicy()
    {
        return auth()->user()->isSuperAdmin();
    }
}
