<?php

namespace App\Http\Controllers\Group;

use App\Models\Group;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Group $group){
        $this->authorize('group-policy', [Group::class]);
        $group->delete();
        return redirect()->route('group.index');
    }
}
