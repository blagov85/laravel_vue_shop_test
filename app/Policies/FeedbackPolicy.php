<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;

class FeedbackPolicy
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

    public function feedbackPolicy()
    {
        return auth()->user()->isAdmin() || auth()->user()->isWriter() || auth()->user()->isManager();
    }
}
