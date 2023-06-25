<?php

namespace App\Http\Controllers\User;

use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\User\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, User $user){
        $this->authorize('user-show-edit-update-policy', $user);
        $data = $request->validated();
        if(isset($data['birth_date']))
            $data['birth_date'] = Carbon::createFromFormat('d/m/Y', $data['birth_date'])->format('Y-m-d');
        $user->update($data);
        return view('user.show', compact('user'));
    }
}
