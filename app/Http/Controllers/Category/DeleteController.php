<?php

namespace App\Http\Controllers\Category;

use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DeleteController extends Controller
{
    public function __invoke(Category $category){
        $this->authorize('category-policy', [Category::class]);
        $category->delete();
        return redirect()->route('category.index');
    }
}
