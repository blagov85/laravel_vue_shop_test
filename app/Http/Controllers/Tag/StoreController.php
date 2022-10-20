<?php

namespace App\Http\Controllers\Tag;

use App\Models\Tag;
use App\Http\Controllers\Controller;
use App\Http\Requests\Tag\StoreRequest;

class StoreController extends Controller
{
    public function __invoke(StoreRequest $request){
        $this->authorize('tag-policy', [Tag::class]);
        $data = $request->validated();
        Tag::firstOrCreate($data);
        return redirect()->route('tag.index');
    }
}
