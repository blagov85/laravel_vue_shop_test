<?php

namespace App\Http\Controllers\Role;

use App\Models\Role;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Role\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Role $role){
        $this->authorize('role-policy', [Role::class]);
        $data = $request->validated();
        $role->update($data);
        return view('role.show', compact('role'));
    }
}
