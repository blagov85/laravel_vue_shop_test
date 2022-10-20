<?php

namespace App\Http\Controllers\Group;

use App\Models\Group;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Group\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Group $group){
        $this->authorize('group-policy', [Group::class]);
        $data = $request->validated();
        $group->update($data);
        return view('group.show', compact('group'));
    }
}
