<?php

namespace App\Http\Controllers\Tag;

use App\Models\Tag;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EditController extends Controller
{
    public function __invoke(Tag $tag){
        $this->authorize('tag-policy', [Tag::class]);
        return view('tag.edit', compact('tag'));
    }
}
