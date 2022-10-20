<?php

namespace App\Http\Controllers\Tag;

use App\Models\Tag;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CreateController extends Controller
{
    public function __invoke(){
        $this->authorize('tag-policy', [Tag::class]);
        return view('tag.create');
    }
}
