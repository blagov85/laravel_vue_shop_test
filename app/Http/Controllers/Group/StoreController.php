<?php

namespace App\Http\Controllers\Group;

use App\Models\Group;
use App\Http\Controllers\Controller;
use App\Http\Requests\Group\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('group-policy', [Group::class]);
        $data = $request->validated();
        Group::firstOrCreate($data);
        return redirect()->route('group.index');
    }
}
