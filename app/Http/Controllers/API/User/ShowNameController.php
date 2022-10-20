<?php

namespace App\Http\Controllers\API\User;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\User\UserNameResource;


class ShowNameController extends Controller
{
    public function __invoke(){
        return new UserNameResource(Auth::user());
    }
}
