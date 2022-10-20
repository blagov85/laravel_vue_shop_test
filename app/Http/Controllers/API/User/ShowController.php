<?php

namespace App\Http\Controllers\API\User;

use Carbon\Carbon;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Resources\User\UserResource;
use App\Http\Controllers\API\User\BirthData;

class ShowController extends Controller
{
    public function __invoke(){
        $dt = Carbon::parse(Auth::user()->birth_date);
        $birthData = new BirthData();
        $birthData->day = $dt->day;
        $birthData->month = $dt->month;
        $birthData->year = $dt->year;
        Auth::user()->birthData = $birthData;
        //$dt->hour;
        return new UserResource(Auth::user());
    }
}
