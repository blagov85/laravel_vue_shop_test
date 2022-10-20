<?php

namespace App\Http\Controllers\Tag;

use App\Models\Tag;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('tag-policy', [Tag::class]);
        $tags = Tag::all();
        return view('tag.index', compact('tags'));
    }
}
