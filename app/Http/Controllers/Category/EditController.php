<?php

namespace App\Http\Controllers\Category;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class EditController extends Controller
{
    public function __invoke(Category $category){
        $this->authorize('category-policy', [Category::class]);
        return view('category.edit', compact('category'));
    }
}
