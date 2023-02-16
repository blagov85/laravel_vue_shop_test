<?php

namespace App\Http\Controllers\API;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Providers\RouteServiceProvider;
use Validator;
use Illuminate\Foundation\Auth\AuthenticatesUsers;

class ChangePasswordController extends Controller
{
    
    public function changePassword()
    {
    return view('auth.passwords.change-password');
    }

    public function updatePassword(Request $request)
    {
        # Validation
        // $request->validate([
        //     'old_password' => 'required',
        //     'new_password' => 'required|confirmed',
        // ]);

        $validator = Validator::make($request->all(), [
            'old_password' => 'required',
            'new_password' => 'required|confirmed',
        ]);

        if ($validator->fails()){
            return response(['errors' => $validator->errors()], 422);
        }

        #Match The Old Password
        if(!Hash::check($request->old_password, auth()->user()->password)){
            return response(['error' => "Старый пароль не верный"]);
        }


        #Update the new Password
        User::whereId(auth()->user()->id)->update([
            'password' => Hash::make($request->new_password)
        ]);

        return response(['message' => "Пароль успешно изменен"]);
        //return back()->with("status", "Password changed successfully!");
    }

}
