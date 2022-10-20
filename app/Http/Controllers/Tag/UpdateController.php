<?php

namespace App\Http\Controllers\Tag;

use App\Models\Tag;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Tag\UpdateRequest;

class UpdateController extends Controller
{
    public function __invoke(UpdateRequest $request, Tag $tag){
        $this->authorize('tag-policy', [Tag::class]);
        $data = $request->validated();
        $tag->update($data);
        return view('tag.show', compact('tag'));
    }
}
