<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class CountryPolicy
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

    public function countryPolicy()
    {
        return auth()->user()->isSuperAdmin() || auth()->user()->isAdmin() || auth()->user()->isWriter();
    }

    public function countryDeletePolicy()
    {
        return auth()->user()->isSuperAdmin();
    }
}
