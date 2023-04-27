<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CheckEmployeeMiddlewareController extends Controller
{
    public function __invoke(Request $request){
        $route = $request->input('route');
        $message = $request->input('message');
        $redirectText = $request->input('redirectText');
        return view('check-employee-middleware', compact('route','message','redirectText'));
    }
}
