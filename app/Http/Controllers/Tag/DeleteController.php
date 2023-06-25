<?php

namespace App\Http\Controllers\Tag;

use App\Models\Tag;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Tag $tag){
        $this->authorize('tag-delete-policy', [Tag::class]);
        $tag->delete();
        return redirect()->route('tag.index');
    }
}
