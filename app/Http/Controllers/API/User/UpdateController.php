<?php

namespace App\Http\Controllers\API\User;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\API\User\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request){
        $data = $request->validated();
        $data['birth_date'] = Carbon::createFromFormat('Y-m-d', $data['birth_date'])->format('Y-m-d');
        Auth::user()->update($data);
        return "Данные успешно изменены";
    }
}
