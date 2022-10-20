<?php

namespace App\Http\Controllers\Category;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class IndexController extends Controller
{
    public function __invoke(){
        $this->authorize('category-policy', [Category::class]);
        $categories = Category::all();
        return view('category.index', compact('categories'));
    }
}
