<?php

namespace App\Http\Controllers\User;

use Carbon\Carbon;
use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Http\Requests\User\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('user-policy', [User::class]);
        $data = $request->validated();
        $data['password'] = Hash::make($data['password']);
        if(isset($data['birth_date']))
            $data['birth_date'] = Carbon::createFromFormat('d/m/Y', $data['birth_date'])->format('Y-m-d');
        User::firstOrCreate([
            'email' => $data['email']
        ], $data);
        return redirect()->route('user.index');
    }
}
