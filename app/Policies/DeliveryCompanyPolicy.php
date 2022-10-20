<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class DeliveryCompanyPolicy
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

    public function deliveryCompanyPolicy()
    {
        return auth()->user()->isAdmin() || auth()->user()->isWriter();
    }
}
