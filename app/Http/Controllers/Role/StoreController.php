<?php

namespace App\Http\Controllers\Role;

use App\Models\Role;
use App\Http\Controllers\Controller;
use App\Http\Requests\Role\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('role-policy', [Role::class]);
        $data = $request->validated();
        Role::firstOrCreate($data);
        return redirect()->route('role.index');
    }
}
