<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Illuminate\Support\Facades\Auth;

class CheckEmployee
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if(auth()->check() && (auth()->user()->isCustomer())){
            
            if(app('router')->getRoutes()->match(app('request')->create(URL::previous()))->getName() == 'login'){
                Auth::logout();
                $request->session()->invalidate();
                $request->session()->regenerateToken();

                $route = '/login';
                $message = 'Ви не можете увійти на сторінку адміністрування сайту, бо ви є його клієнтом';
                $redirectText = 'Перейти до Log in';
            }else{
                $route = '/';
                $message = 'Ви є клієнтом сайту. Будь ласка, перейдіть до каталогу товарів';
                $redirectText = 'Перейти до каталогу товарів';
            }

            return redirect()->route('attention', 
                    [
                        'route' => $route, 
                        'message' => $message,
                        'redirectText' => $redirectText
                    ]);

        }
        return $next($request);
    }
}
